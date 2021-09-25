import Foundation
import Combine

class SlackChatPostMessageRepository: DependsOnAPIClient {
    fileprivate static let instance = SlackChatPostMessageRepository()
    
    func create(parameter: [String: Any]) -> AnyPublisher<Void, Error> {
        Just(parameter)
            .map { SlackChatPostMessageEndpoint().create(parameters: $0) }
            .compactMap { [weak self] in self?.apiClient.combineRequestVoid(target: $0) }
            .flatMap { $0 }
            .eraseToAnyPublisher()
    }
}

protocol DepecdsOnSlackChatPostMessageRepository {
    var slackChatPostMessageRepository: SlackChatPostMessageRepository { get }
}

extension DepecdsOnSlackChatPostMessageRepository {
    var slackChatPostMessageRepository: SlackChatPostMessageRepository { SlackChatPostMessageRepository.instance }
}
