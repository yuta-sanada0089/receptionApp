import Foundation

class SlackUsersRepository: ResourceRepository {
    typealias Model = SlackUsers
    
    fileprivate static let instance = SlackUsersRepository()
    func apiRequest(_ parameters: [String: Any]?) -> Request<SlackUsers> {
        SlackUsersEndpoint().show()
    }
}

protocol DepecdsOnSlackUsersRepository {
    var slackUsersRepository: SlackUsersRepository { get }
}

extension DepecdsOnSlackUsersRepository {
    var slackUsersRepository: SlackUsersRepository { SlackUsersRepository.instance }
}
