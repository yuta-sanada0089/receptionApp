import Foundation
import Moya

struct APITarget: TargetType {
    let baseURL: URL
    let sampleData: Data
    let task: Task
    let headers: [String: String]?
    let path: String
    let method: Moya.Method
    let parameters: [String: Any]?
    let validationType: Moya.ValidationType = .none

    init<E>(request: Request<E>) {
        baseURL = request.baseURL
        sampleData = request.sampleData
        task = request.task
        headers = request.headers
        path = request.path
        method = request.method
        parameters = request.parameters
    }
}
