import Foundation

class SlackConversationEndpoint: SlackEndpoint, ShowEndpoint {
    typealias ResponseType = SlackConversation
    let path: String = "/conversations.members"
}
