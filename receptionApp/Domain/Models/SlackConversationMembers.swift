import Foundation
import ObjectMapper

class SlackConversation: ImmutableMappable {
    let members: [String]
    
    required init(map: Map) throws {
        members = try map.value("members")
    }
}
