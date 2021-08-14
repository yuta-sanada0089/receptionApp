import Foundation

protocol DebugLogger: DependsOnBuildEnvironment {
}

extension DebugLogger {
    func log(_ message: String, file: String = #file, line: Int = #line) {
        guard buildEnvironment.configuration == .debug else { return }

        print("\(Date().iso8601String()) \(file.components(separatedBy: "/").last ?? ""):\(line) \(message)")
    }
}

struct DebugLoggerImpl: DebugLogger {
}

protocol DependsOnDebugLogger {
    var debugLogger: DebugLogger { get }
}

extension DependsOnDebugLogger {
    var debugLogger: DebugLogger { DebugLoggerImpl() }
}
