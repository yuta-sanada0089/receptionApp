import SwiftUI
import Combine

class SearchViewModel: ObservableObject, DepecdsOnSlackUsersRepository {
    @Published var members: [User] = []
    @Published var error: Error?
    var cancellables = [AnyCancellable]()
    
    init() {
        self.fetchMembers()
    }

    func fetchMembers() {
        slackUsersRepository.load()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { slackUsers in
                self.members = slackUsers.displayMembers
            })
            .store(in: &cancellables)
    }
}
