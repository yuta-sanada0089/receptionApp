import Foundation

class SlackConversationsEndpoint: SlackEndpoint, ShowEndpoint {
    typealias ResponseType = SlackConversationMembers
    let path: String = "/conversations.members?channel=hogehoge&pretty=1"
}
