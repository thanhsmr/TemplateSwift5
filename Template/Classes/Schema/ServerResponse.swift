import Foundation
import ObjectMapper

class ServerResponse: Mappable{
    
    var error : AnyObject?
    var data : AnyObject?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map)
    {
        error <- map["error"]
        data <- map["data"]
    }
}
