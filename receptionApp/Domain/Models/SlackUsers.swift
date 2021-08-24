import Foundation
import ObjectMapper

class SlackUsers: ImmutableMappable {
    let members: [User]
    let cacheTs: Int
    
    var displayMembers: [User] {
        members.filter { $0.isAdmin || $0.isOwner || $0.isPrimaryOwner }
    }

    required init(map: Map) throws {
        members = try map.value("members")
        cacheTs = try map.value("cache_ts")
    }
}
