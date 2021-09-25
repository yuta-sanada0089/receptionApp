import Foundation

class SlackChatPostMessageEndpoint: SlackEndpoint, CreateEndpoint {
    typealias ResponseType = SlackChatPostMessage
    
    let path: String = "/chat.postMessage"
}
