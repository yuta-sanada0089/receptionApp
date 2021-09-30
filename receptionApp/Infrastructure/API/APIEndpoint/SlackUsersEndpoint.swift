import Foundation

class SlackUsersEndpoint: SlackEndpoint, ShowEndpoint {
    typealias ResponseType = SlackUsers
    let path: String = "/users.list"
}
