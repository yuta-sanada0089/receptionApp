import Foundation

enum BuildConfiguration {
    case debug
    case release
}

enum AppType {
    case production
}

protocol BuildEnvironment {
    var configuration: BuildConfiguration { get }
    var appType: AppType { get }
}

class BuildEnvironmentImpl: BuildEnvironment {
    #if DEBUG
    let configuration: BuildConfiguration = .debug
    #else
    let configuration: BuildConfiguration = .release
    #endif

    let appType: AppType = .production
}

protocol DependsOnBuildEnvironment {
    var buildEnvironment: BuildEnvironment { get }
}

extension DependsOnBuildEnvironment {
    var buildEnvironment: BuildEnvironment { BuildEnvironmentImpl() }
}
