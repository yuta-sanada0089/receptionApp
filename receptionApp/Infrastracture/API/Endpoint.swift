import Foundation

protocol Endpoint {
    associatedtype ResponseType
    
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var token: String? { get }
}

class APIEndpoint {
    var baseURL: URL = URL(string: "https://")!
    var headers: [String: String]? = nil
    var token: String? = nil
}

class SlackEndpoint {
    var baseURL: URL = URL(string: "https://slack.com/api")!
    var headers: [String: String]? = ["Content-Type": "application/x-www-form-urlencoded"]
    var token: String? = "token"
}

protocol CreateEndpoint: Endpoint {
    func create(parameters: [String: Any]?, version: Int?) -> Request<ResponseType>
}

extension CreateEndpoint {
    func create(parameters: [String: Any]? = nil, version: Int? = nil) -> Request<ResponseType> {
        .init(
            baseURL: baseURL,
            path: path,
            method: .post,
            headers: headers,
            parameters: parameters,
            token: token,
            version: version
        )
    }
}

protocol IndexEndpoint: Endpoint {
    func index(parameters: [String: Any]?, version: Int?) -> Request<ResponseType>
}

extension IndexEndpoint {
    func index(parameters: [String: Any]? = nil, version: Int? = nil) -> Request<ResponseType> {
        .init(
            baseURL: baseURL,
            path: path,
            method: .get,
            headers: headers,
            parameters: parameters,
            token: token,
            version: version
        )
    }
}

protocol ShowEndpoint: Endpoint {
    func show(parameters: [String: Any]?, version: Int?) -> Request<ResponseType>
}

extension ShowEndpoint {
    func show(parameters: [String: Any]? = nil, version: Int? = nil) -> Request<ResponseType> {
        .init(
            baseURL: baseURL,
            path: path,
            method: .get,
            headers: headers,
            parameters: parameters,
            token: token,
            version: version
        )
    }
}
