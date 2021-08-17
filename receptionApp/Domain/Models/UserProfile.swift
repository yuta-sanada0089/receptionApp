import Foundation
import ObjectMapper

class UserProfile: ImmutableMappable {
    let realName: String
    let displayName: String
    let email: String
    let image24: String
    let image32: String
    let image48: String
    let image72: String
    let image192: String
    let image512: String
    let image1024: String
    let firstName: String
    let lastName: String
    
    required init(map: Map) throws {
        realName = try map.value("real_name")
        displayName = try map.value("display_name")
        email = try map.value("email")
        image24 = try map.value("image_24")
        image32 = try map.value("image_32")
        image48 = try map.value("image_48")
        image72 = try map.value("image_72")
        image192 = try map.value("image_192")
        image512 = try map.value("image_512")
        image1024 = try map.value("image_1024")
        firstName = try map.value("first_name")
        lastName = try map.value("last_name")
    }
}
