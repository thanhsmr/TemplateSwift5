import Foundation
import PromiseKit

public enum LoginState: Int {
    case ValidUser = 0
    case LoggedOut = 1
}

class AuthManager {
    
    private class func getAuthenticatedUser() -> Bool {
        return UserDefaults.standard.bool(forKey: "authenticated")
    }
    
    private class func setAuthenticatedUser(authenticated : Bool){
        UserDefaults.standard.set(authenticated, forKey: "authenticated")
    }
    
    class func getLoginState() -> LoginState {
        
        if AuthManager.getAuthenticatedUser() {
            return .ValidUser
        }
        
        return .LoggedOut
    }
    
    class func isValidUser() -> Bool {
        return getLoginState() == .ValidUser
    }
    
    class func logout(){
        
        CacheManager.sharedManager.clearAllCaches()
        Context.clearAccessToken()
        
        AuthManager.setAuthenticatedUser(authenticated: false)
    }

    // MARK: - Data, API calls
    
    class func requestAccessToken(_ authorizationCode: String, source: String) -> Promise<Token> {
        
        return Promise { seal in
            
            _ = AuthService.requestAccessToken(authorizationCode, source: source, completion: { token in
        
                Context.saveAccessToken(token.accessToken)
                AuthManager.setAuthenticatedUser(authenticated: true)
                
                seal.fulfill(token)
                
            }, fail: { error in
                seal.reject(error)
            })
        }
    }
    
    // MARK: - UI, Flow Control
    
    class func goToDashboardPage(){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        appDelegate.window!.rootViewController = storyBoard.instantiateViewController(withIdentifier: Constants.StoryboardID.DashboardVC)
//        appDelegate.window!.makeKeyAndVisible()
    }
    
    class func goToLoginPage(){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        appDelegate.window!.rootViewController = storyBoard.instantiateViewController(withIdentifier: Constants.StoryboardID.LoginVC)
//        appDelegate.window!.makeKeyAndVisible()
    }
}
