import Foundation
import Combine

class VisitorViewModel: ObservableObject {
    @Published var companyName: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var isPushActive: Bool = false
    @Published var isAlertActive: Bool = false
    let buttonTapped = PassthroughSubject<Void, Never>()
    
    private var anyCancellable = Set<AnyCancellable>()
    
    func onTapButton() {
        if firstName.count > 0 && lastName.count > 0 {
            isPushActive = true
            isAlertActive = false
        } else {
            isPushActive = false
            isAlertActive = true
        }
    }
}
