import Foundation
import Combine

class VisitorViewModel: ObservableObject {
    @Published var user: User?
    @Published var buttonType: ButtonType
    @Published var companyName: String = ""
    @Published var visitorName: String = ""
    @Published var guestCount: Int = 0
    @Published var isPushActive: Bool = false
    @Published var isAlertActive: Bool = false
    let buttonTapped = PassthroughSubject<Void, Never>()
    
    private var anyCancellable = Set<AnyCancellable>()
    
    init(user: User?, buttonType: ButtonType) {
        self.user = user
        self.buttonType = buttonType
    }
    
    func onTapButton() {
        isPushActive = visitorName.count > 0
        isAlertActive = visitorName.isEmpty
    }
}
