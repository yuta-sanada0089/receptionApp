import Foundation
import UIKit
import ObjectMapper

class Profile: ImmutableMappable {
    let title: String?
    let realName: String?
    let displayName: String?
    let email: String?
    let image24: URL?
    let image32: URL?
    let image48: URL?
    let image72: URL?
    let image192: URL?
    let image512: URL?
    let image1024: URL?
    let firstName: String?
    let lastName: String?
    
    var displayImage: UIImage {
        guard let image = image192 else { return UIImage(named: "ic_person")! }
        if let data = try? Data(contentsOf: image) {
            return UIImage(data: data) ?? UIImage(named: "ic_person")!
        } else {
            return UIImage(named: "ic_person")!
        }
    }

    
    required init(map: Map) throws {
        title = try? map.value("title")
        realName = try? map.value("real_name")
        displayName = try? map.value("display_name")
        email = try? map.value("email")
        image24 = (try? map.value("image_24")).flatMap { URL(string: $0) }
        image32 = (try? map.value("image_32")).flatMap { URL(string: $0) }
        image48 = (try? map.value("image_48")).flatMap { URL(string: $0) }
        image72 = (try? map.value("image_72")).flatMap { URL(string: $0) }
        image192 = (try? map.value("image_192")).flatMap { URL(string: $0) }
        image512 = (try? map.value("image_512")).flatMap { URL(string: $0) }
        image1024 = (try? map.value("image_1024")).flatMap { URL(string: $0) }
        firstName = try? map.value("first_name")
        lastName = try? map.value("last_name")
    }
}
