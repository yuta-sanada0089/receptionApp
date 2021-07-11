import Foundation

enum APIError: LocalizedError {
    // 400 Client Error
    case badRequest(message: String?)
    case unauthorized(message: String?)
    case paymentRequired(message: String?)
    case forbidden(message: String?)
    case notFound(message: String?)
    case methodNotAllowed(message: String?)
    case notAcceptable(message: String?)
    case proxyAuthenticationRequired(message: String?)
    case requestTimeout(message: String?)
    case conflict(message: String?)
    case gone(message: String?)
    case lengthRequired(message: String?)
    case preconditionFailed(message: String?)
    case payloadTooLarge(message: String?)
    case uriTooLong(message: String?)
    case unsupportedMediaType(message: String?)
    case rangeNotSatisfiable(message: String?)
    case expectationFailed(message: String?)
    case imATeapot(message: String?)
    case unprocessableEntity(message: String?)
    case locked(message: String?)
    case failedDependency(message: String?)
    case upgradeRequired(message: String?)
    case preconditionRequired(message: String?)
    case tooManyRequests(message: String?)
    case requestHeaderFieldsTooLarge(message: String?)
    case unavailableForLegalReasons(message: String?)

    // 500 Server Error
    case internalServerError(message: String?)
    case notImplemented(message: String?)
    case badGateway(message: String?)
    case serviceUnavailable(message: String?)
    case gatewayTimeout(message: String?)
    case httpVersionNotSupported(message: String?)
    case variantAlsoNegotiates(message: String?)
    case insufficientStorage(message: String?)
    case loopDetected(message: String?)
    case notExtended(message: String?)
    case networkAuthenticationRequired(message: String?)

    case unknown(message: String?)

    // swiftlint:disable:next cyclomatic_complexity
    static func fromStatus(statusCode: Int, message: String?) -> APIError {
        switch statusCode {
        case 400: return .badRequest(message: message)
        case 401: return .unauthorized(message: message)
        case 402: return .paymentRequired(message: message)
        case 403: return .forbidden(message: message)
        case 404: return .notFound(message: message)
        case 405: return .methodNotAllowed(message: message)
        case 406: return .notAcceptable(message: message)
        case 407: return .proxyAuthenticationRequired(message: message)
        case 408: return .requestTimeout(message: message)
        case 409: return .conflict(message: message)
        case 410: return .gone(message: message)
        case 411: return .lengthRequired(message: message)
        case 412: return .preconditionFailed(message: message)
        case 413: return .payloadTooLarge(message: message)
        case 414: return .uriTooLong(message: message)
        case 415: return .unsupportedMediaType(message: message)
        case 416: return .rangeNotSatisfiable(message: message)
        case 417: return .expectationFailed(message: message)
        case 418: return .imATeapot(message: message)
        case 422: return .unprocessableEntity(message: message)
        case 423: return .locked(message: message)
        case 424: return .failedDependency(message: message)
        case 426: return .upgradeRequired(message: message)
        case 428: return .preconditionRequired(message: message)
        case 429: return .tooManyRequests(message: message)
        case 431: return .requestHeaderFieldsTooLarge(message: message)
        case 451: return .unavailableForLegalReasons(message: message)
        case 500: return .internalServerError(message: message)
        case 501: return .notImplemented(message: message)
        case 502: return .badGateway(message: message)
        case 503: return .serviceUnavailable(message: message)
        case 504: return .gatewayTimeout(message: message)
        case 505: return .httpVersionNotSupported(message: message)
        case 506: return .variantAlsoNegotiates(message: message)
        case 507: return .insufficientStorage(message: message)
        case 508: return .loopDetected(message: message)
        case 510: return .notExtended(message: message)
        case 511: return .networkAuthenticationRequired(message: message)
        default: return .unknown(message: message)
        }
    }

    var errorDescription: String? {
        errorMessage
    }

    var errorMessage: String {
        switch self {
        case .badRequest(let message): return message ?? "入力した内容を確認してください"
        case .unauthorized(let message): return message ?? "ログインが必要です"
        case .paymentRequired(let message): return message ?? defaultUnknownErrorMessage
        case .forbidden(let message): return message ?? "閲覧する権限がないか、URLが間違っている可能性があります"
        case .notFound(let message): return message ?? "削除されたか、間違ったページの可能性があります"
        case .methodNotAllowed(let message): return message ?? defaultUnknownErrorMessage
        case .notAcceptable(let message): return message ?? defaultUnknownErrorMessage
        case .proxyAuthenticationRequired(let message): return message ?? defaultUnknownErrorMessage
        case .requestTimeout(let message): return message ?? defaultUnknownErrorMessage
        case .conflict(let message): return message ?? defaultUnknownErrorMessage
        case .gone(let message): return message ?? defaultUnknownErrorMessage
        case .lengthRequired(let message): return message ?? defaultUnknownErrorMessage
        case .preconditionFailed(let message): return message ?? defaultUnknownErrorMessage
        case .payloadTooLarge(let message): return message ?? defaultUnknownErrorMessage
        case .uriTooLong(let message): return message ?? defaultUnknownErrorMessage
        case .unsupportedMediaType(let message): return message ?? defaultUnknownErrorMessage
        case .rangeNotSatisfiable(let message): return message ?? defaultUnknownErrorMessage
        case .expectationFailed(let message): return message ?? defaultUnknownErrorMessage
        case .imATeapot(let message): return message ?? defaultUnknownErrorMessage
        case .unprocessableEntity(let message): return message ?? defaultUnknownErrorMessage
        case .locked(let message): return message ?? defaultUnknownErrorMessage
        case .failedDependency(let message): return message ?? defaultUnknownErrorMessage
        case .upgradeRequired(let message): return message ?? defaultUnknownErrorMessage
        case .preconditionRequired(let message): return message ?? defaultUnknownErrorMessage
        case .tooManyRequests(let message): return message ?? defaultUnknownErrorMessage
        case .requestHeaderFieldsTooLarge(let message): return message ?? defaultUnknownErrorMessage
        case .unavailableForLegalReasons(let message): return message ?? defaultUnknownErrorMessage
        case .internalServerError(let message): return message ?? defaultServerErrorMessage
        case .notImplemented(let message): return message ?? defaultServerErrorMessage
        case .badGateway(let message): return message ?? defaultServerErrorMessage
        case .serviceUnavailable(let message): return message ?? defaultServerErrorMessage
        case .gatewayTimeout(let message): return message ?? defaultServerErrorMessage
        case .httpVersionNotSupported(let message): return message ?? defaultServerErrorMessage
        case .variantAlsoNegotiates(let message): return message ?? defaultServerErrorMessage
        case .insufficientStorage(let message): return message ?? defaultServerErrorMessage
        case .loopDetected(let message): return message ?? defaultServerErrorMessage
        case .notExtended(let message): return message ?? defaultServerErrorMessage
        case .networkAuthenticationRequired(let message): return message ?? defaultServerErrorMessage
        case .unknown(let message): return message ?? defaultServerErrorMessage
        }
    }

    private var defaultServerErrorMessage: String {
        "サーバーエラーです。しばらく待ってから再度行うか、お問い合わせください。"
    }

    private var defaultUnknownErrorMessage: String {
        "不明な通信エラーです。"
    }
}
