import Foundation

class SlackUserListEndpoint: SlackEndpoint, ShowEndpoint {
    typealias ResponseType = SlackConversation
    let path: String = "/users.list"
}
