import Foundation

struct ReceptionButton {
    var buttonType: ButtonType
}

enum ButtonType: String {
    case searchByName
    case general
    case interview
    case delivery
    
    func title() -> String {
        switch self {
        case .searchByName: return "担当者で探す方はこちら"
        case .general: return "総合受付"
        case .interview: return "採用の方はこちら"
        case .delivery: return "配送業者の方はこちら"
        }
    }
    
    func subTitle() -> String {
        switch self {
        case .searchByName: return "Search by name"
        case .general: return "General reception"
        case .interview: return "Interviwees"
        case .delivery: return "Deliveries"
        }
    }
}
