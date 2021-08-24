import Foundation
import ObjectMapper
import Combine

protocol ResourceRepository: AnyObject, DependsOnAPIClient {
    associatedtype Model: ImmutableMappable
    func load(_ parameters: [String: Any]) -> AnyPublisher<Model, Error>
    func apiRequest(_ parameters: [String: Any]?) -> Request<Model>
}

extension ResourceRepository {
    func load(_ parameters: [String: Any] = [:]) -> AnyPublisher<Model, Error> {
        apiClient.combineRequest(target: apiRequest(parameters))
            .eraseToAnyPublisher()
    }
}
