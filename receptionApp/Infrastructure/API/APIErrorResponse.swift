import ObjectMapper

class APIErrorResponse: ImmutableMappable {
    let title: String
    let errors: String
    let status: Int

    var message: String {
        errors
    }
    
    required init(map: Map) throws {
        title = try map.value("title")
        errors = try map.value("errors")
        status = try map.value("status")
    }
}
