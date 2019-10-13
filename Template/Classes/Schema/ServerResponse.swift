import Foundation

struct ServerResponse: Codable {
    
    var error : String?
    var data : String?
    
    private enum CodingKeys: String, CodingKey {
        case error = "error"
        case data = "data"
    }
}
