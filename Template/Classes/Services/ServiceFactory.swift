import Foundation
import Alamofire

class ServiceFactory {
    
    static let oauthHandler = OAuth2Handler(
        clientID: "12345678",
        baseURLString: Constants.API.baseURL,
        accessToken: "abcd1234",
        refreshToken: "ef56789a"
    )
    
    class func post(url: String, parameters: Parameters, completion: @escaping (_ response: DataResponse<Any>) -> ()) -> DataRequest {
        
        let header = [Constants.Parameter.Accept: Constants.Parameter.ApplicationJson,
                      Constants.Parameter.AccessTokenType: Context.getAccessToken(),
                      Constants.Parameter.ContentType : Constants.Parameter.FormUrlEncoded,
                      Constants.Parameter.UserNameHeader : Constants.Parameter.UserNameHeaderValue,
                      Constants.Parameter.PasswordHeader : Constants.Parameter.PasswordHeaderValue]
    
        let encoding = URLEncoding.default
        let sm = Alamofire.SessionManager()
        sm.adapter = ServiceFactory.oauthHandler
        sm.retrier = ServiceFactory.oauthHandler
        
        return sm.request(url, method: .post, parameters: parameters, encoding: encoding, headers: header).validate().responseJSON { (response) in
            completion(response)
        }
        
    }
    
    class func get(url: String, parameters: Parameters? = nil, completion: @escaping (_ response: DataResponse<Any>) -> ()) -> DataRequest {
        
        let header = [Constants.Parameter.Accept: Constants.Parameter.ApplicationJson,
                      Constants.Parameter.AccessTokenType: Context.getAccessToken(),
                      Constants.Parameter.ContentType : Constants.Parameter.FormUrlEncoded,
                      Constants.Parameter.UserNameHeader : Constants.Parameter.UserNameHeaderValue,
                      Constants.Parameter.PasswordHeader : Constants.Parameter.PasswordHeaderValue]
        
        let sm = Alamofire.SessionManager()
        sm.adapter = ServiceFactory.oauthHandler
        sm.retrier = ServiceFactory.oauthHandler
        
        return sm.request(url, method: .get, parameters: parameters, headers: header)
            .responseJSON { response in
                
                completion(response)
        }
        
    }
    
    class func put(url: String, parameters: Parameters, completion: @escaping (_ response: DataResponse<Any>) -> ()) -> DataRequest {
        
        let header = [Constants.Parameter.Accept: Constants.Parameter.ApplicationJson,
                      Constants.Parameter.AccessTokenType: Context.getAccessToken(),
                      Constants.Parameter.ContentType : Constants.Parameter.FormUrlEncoded,
                      Constants.Parameter.UserNameHeader : Constants.Parameter.UserNameHeaderValue,
                      Constants.Parameter.PasswordHeader : Constants.Parameter.PasswordHeaderValue]
        
        let encoding = URLEncoding.default
        let sm = Alamofire.SessionManager()
        sm.adapter = ServiceFactory.oauthHandler
        sm.retrier = ServiceFactory.oauthHandler
        
        return sm.request(url, method: .put, parameters: parameters, encoding: encoding, headers: header)
            .responseJSON { response in
                completion(response)
        }
        
    }
    
    class func patch(url: String, parameters: Parameters, completion: @escaping (_ response: DataResponse<Any>) -> ()) -> DataRequest {
        
        let header = [Constants.Parameter.Accept: Constants.Parameter.ApplicationJson,
                      Constants.Parameter.AccessTokenType: Context.getAccessToken(),
                      Constants.Parameter.ContentType : Constants.Parameter.FormUrlEncoded,
                      Constants.Parameter.UserNameHeader : Constants.Parameter.UserNameHeaderValue,
                      Constants.Parameter.PasswordHeader : Constants.Parameter.PasswordHeaderValue]
        
        let encoding = URLEncoding.default
        let sm = Alamofire.SessionManager()
        sm.adapter = ServiceFactory.oauthHandler
        sm.retrier = ServiceFactory.oauthHandler
        
        return sm.request(url, method: .patch, parameters: parameters, encoding: encoding, headers: header)
            .responseJSON { response in
                
                completion(response)
        }
        
    }
}
