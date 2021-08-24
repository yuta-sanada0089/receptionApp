import Foundation

class SlackConversationRepository: ResourceRepository {
    typealias Model = SlackConversation
    
    fileprivate static let instance = SlackConversationRepository()
    
    func apiRequest(_ parameters: [String: Any]?) -> Request<SlackConversation> {
        SlackConversationEndpoint().show(parameters: parameters)
    }
}

protocol DepecdsOnSlackConversationsRepository {
    var slackConversationRepository: SlackConversationRepository { get }
}

extension DepecdsOnSlackConversationsRepository {
    var slackConversationRepository: SlackConversationRepository { SlackConversationRepository.instance }
}
