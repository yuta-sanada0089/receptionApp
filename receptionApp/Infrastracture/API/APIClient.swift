import Foundation
import Combine
import Moya
import CombineMoya
import ObjectMapper

protocol APIClient: AnyObject,
    DependsOnDebugLogger,
    DependsOnBuildEnvironment {
    var queue: DispatchQueue { get }
    var provider: MoyaProvider<APITarget> { get }
}

extension APIClient {
    func combineRequestVoid<E: ImmutableMappable>(target: Request<E>, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<Void, Error> {
        _request(target: target, callbackQueue: callbackQueue)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
    
    func combineRequest<E: ImmutableMappable>(target: Request<E>, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<E, Error> {
        _request(target: target, callbackQueue: callbackQueue)
            .map { try! Mapper<E>().map(JSONString: $0) }
            .eraseToAnyPublisher()
    }
    
    func combineRequestList<E: ImmutableMappable>(target: Request<E>, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<[E], Error> {
        _request(target: target, callbackQueue: callbackQueue)
            .map { try! Mapper<E>().mapArray(JSONString: $0) }
            .eraseToAnyPublisher()
    }
    
    private func _request<E>(target: Request<E>, callbackQueue: DispatchQueue?) -> AnyPublisher<String, Error> {
        return self.provider
            .requestPublisher(APITarget(request: target), callbackQueue: callbackQueue)
            .filterSuccessfulStatusCodes()
            .mapError { [weak self] in self?.mapError($0) ?? RuntimeError("不明なエラー") }
            .handleEvents(receiveOutput: { [weak self] responce in self?.log(response: responce) })
            .map { try! $0.mapString() }
            .eraseToAnyPublisher()
    }
    
    private func mapError(_ error: MoyaError) -> Error? {
        switch error {
        case MoyaError.statusCode(let response):
            log(response: response)

            if response.statusCode == 401 {
                return APIError.unauthorized(message: nil)
            }
            return APIError.fromStatus(statusCode: response.statusCode, message: extractErrorMessage(response))
        case MoyaError.underlying: return RuntimeError("インターネットに接続されていません")
        default: return error
        }
    }
    
    private func extractErrorMessage(_ response: Moya.Response) -> String? {
        (try? response.mapString())
            .flatMap { try? Mapper<APIErrorResponse>().map(JSONString: $0) }?
            .message
    }
    
    private func log(response: Moya.Response) {
        let message = [
            response.request?.httpMethod ?? "",
            response.request?.url?.absoluteString ?? "",
            String(response.statusCode),
            // response.request?.allHTTPHeaderFields?.map { "\($0.key): \($0.value)" }.joined(separator: " / ") ?? "",
            // "\(try? response.mapJSON())"
            (try? response.mapString()) ?? ""
        ].joined(separator: " ")

        debugLogger.log(message)
    }
}

class APIClientImpl: APIClient {
    
    fileprivate static let instance = APIClientImpl()

    let queue = DispatchQueue(
        label: "com.seibii.Seibii.APIClient",
        qos: .default,
        attributes: DispatchQueue.Attributes.concurrent
    )

    lazy var provider: MoyaProvider<APITarget> = .init(callbackQueue: queue)
}

protocol DependsOnAPIClient {
    var apiClient: APIClient { get }
}

extension DependsOnAPIClient {
    var apiClient: APIClient { APIClientImpl.instance }
}
