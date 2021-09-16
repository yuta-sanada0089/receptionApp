import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var isNavigationActive: Binding<Bool> = Binding<Bool>.constant(false)
}
