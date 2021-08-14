import Foundation

extension Date {
    var year: Int {
        Calendar.current.component(.year, from: self)
    }

    var month: Int {
        Calendar.current.component(.month, from: self)
    }

    var day: Int {
        Calendar.current.component(.day, from: self)
    }

    func iso8601String() -> String {
        DateFormatter.iso8601DetailedString(self)
    }

    func dateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MM月dd日（EEE）"
        return formatter.string(from: self)
    }
}
