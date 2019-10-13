import Foundation

struct Token: Codable {
    
    var accessToken = ""
    var expiresIn = 0
    var refreshToken = ""
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case expiresIn = "expiresIn"
        case refreshToken = "refreshToken"
    }
}
