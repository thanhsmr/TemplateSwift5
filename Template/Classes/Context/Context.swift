import Foundation

class Context {
    
    //AccessToken
    class func clearAccessToken() {
        saveAccessToken("")
    }
    
    class func saveAccessToken(_ token: String) -> Void {
        let preferences = UserDefaults.standard
        preferences.set(token,forKey: Constants.UserDefaultsKey.AccessToken)
        preferences.synchronize()
    }
    
    class func getAccessToken() -> String {
        let token = UserDefaults.standard.string(forKey: Constants.UserDefaultsKey.AccessToken)
        return token ?? ""
    }
}
