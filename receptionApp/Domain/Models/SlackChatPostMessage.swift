import Foundation
import ObjectMapper

class SlackChatPostMessage: ImmutableMappable {
    let ok: String
    let error: String?
    
    required init(map: Map) throws {
        ok = try map.value("members")
        error = try? map.value("cache_ts")
    }
}
