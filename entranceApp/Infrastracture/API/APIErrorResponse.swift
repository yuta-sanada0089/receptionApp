import Foundation

struct APIErrorResponse: Decodable {
    let title: String
    let errors: String
    let status: Int

    var message: String {
        errors
    }
}
