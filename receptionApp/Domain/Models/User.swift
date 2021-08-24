import Foundation
import ObjectMapper

class User: ImmutableMappable {
    let id: String
    let teamId: String
    let name: String
    let deleted: Bool
    let realName: String
    let profile: Profile
    let isAdmin: Bool
    let isOwner: Bool
    let isPrimaryOwner: Bool
    
    init(
        id: String,
        teamId: String,
        name: String,
        deleted: Bool,
        realName: String,
        profile: Profile,
        isAdmin: Bool,
        isOwner: Bool,
        isPrimaryOwner: Bool
    ) {
        self.id = id
        self.teamId = teamId
        self.name = name
        self.deleted = deleted
        self.realName = realName
        self.profile = profile
        self.isAdmin = isAdmin
        self.isOwner = isOwner
        self.isPrimaryOwner = isPrimaryOwner
    }
    
    required init(map: Map) throws {
        id = try map.value("id")
        teamId = try map.value("team_id")
        name = try map.value("name")
        deleted = try map.value("deleted")
        realName = try map.value("real_name")
        profile = try map.value("profile")
        isAdmin = try map.value("is_admin")
        isOwner = try map.value("is_owner")
        isPrimaryOwner = try map.value("is_primary_owner")
    }
}
