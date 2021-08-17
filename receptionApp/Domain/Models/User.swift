import Foundation
import ObjectMapper

class User: ImmutableMappable {
    let id: String
    let teamId: String
    let name: String
    let deleted: Bool
    let realName: String
    let profile: UserProfile
    let isAdmin: Bool
    let isOwner: Bool
    let isPrimaryOwner: Bool
    
    required init(map: Map) throws {
        id = try map.value("id")
        teamId = try map.value("team_id")
        name = try map.value("name")
        deleted = try map.value("deleted")
        realName = try map.value("real_name")
        profile = try map.value("profiie")
        isAdmin = try map.value("is_admin")
        isOwner = try map.value("is_owner")
        isPrimaryOwner = try map.value("is_primary_owner")
    }
}
