import Foundation
import Moya

class Request<ResponseType> {
    let baseURL: URL
    let path: String
    let method: Moya.Method
    let parameters: [String: Any]?
    let validationType: Moya.ValidationType = .none

    fileprivate let additionalHeaders: [String: String]?
    fileprivate let version: Int?
    fileprivate let token: String?

    var headers: [String: String]? {
        let authorizationHeader: [String: String] = token.map { ["Authorization": "Bearer \($0)"] } ?? [:]
        let versionHeader: [String: String] = ["X-API-VERSION": "\(version ?? 1)"]

        return (additionalHeaders ?? [:])
            .merging(authorizationHeader) { $1 }
            .merging(versionHeader) { $1 }
    }

    var task: Moya.Task {
        .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var sampleData: Data {
        switch path {
        case "/list":
            return "[{\"id\": 1, \"name\": \"general\"}, {\"id\": 2, \"name\": \"general2\"}]"
                .data(using: String.Encoding.utf8)!
        default:
            return "{\"id\": 1, \"name\": \"general\"}".data(using: String.Encoding.utf8)!
        }
    }

    var parameterEncoding: Moya.ParameterEncoding {
        switch method {
        case .get: return URLEncoding.default
        default: return JSONEncoding.default
        }
    }

    required init(
        baseURL: URL,
        path: String,
        method: Moya.Method,
        headers: [String: String]? = nil,
        parameters: [String: Any]? = nil,
        token: String? = nil,
        version: Int? = nil
    ) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.additionalHeaders = headers
        self.parameters = parameters
        self.token = token
        self.version = version
    }

    func copy(token: String) -> Self {
        .init(
            baseURL: baseURL,
            path: path,
            method: method,
            headers: additionalHeaders,
            parameters: parameters,
            token: token,
            version: version
        )
    }
}

extension Request: CustomDebugStringConvertible {
    var debugDescription: String {
        "APIRequest(path: \(path), method: \(method), headers: \(headers ?? [:]), " +
            "parameters: \(parameters ?? [:]), version: \(version ?? 0)"
    }
}
