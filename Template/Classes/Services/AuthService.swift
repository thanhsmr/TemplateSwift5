import Foundation
import Alamofire

class AuthService {
    
    class func requestAccessToken(_ authorizationCode: String, source: String, completion : @escaping (_ response: Token) -> (), fail: @escaping (Error) -> Void) -> DataRequest {
        
        let parameters = [
            "authorization_code": authorizationCode,
            "source": source
        ]
        
        return ServiceFactory.post(url: Constants.API.RequestAccessToken, parameters: parameters) { response in
            if response.result.isSuccess, response.response?.statusCode == 200 {
                do {
                    let model: Token = try JSONDecoder().decode(Token.self, from: response.data ?? Data())
                    completion(model)
                } catch let error {
                    if let decodingError = (error as? DecodingError) {
                        print(decodingError)
                    }
                    let userInfo: [NSObject : AnyObject] = [NSLocalizedDescriptionKey as NSObject :  NSLocalizedString("Error", value: "", comment: "") as AnyObject]
                    let error = NSError(domain: "", code: 0, userInfo: userInfo as? [String : Any])
                    fail(error)
                }
            }
            
            if let error = response.result.error {
                fail(error)
            } else {
                let error = NSError(domain: "", code: 0, userInfo: nil)
                fail(error)
            }
        }
    }
    
}
