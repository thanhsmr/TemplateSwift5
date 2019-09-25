import UIKit

struct Constants {
    
    struct Domain {
        static let Staging = "http://10.0.0.2:8080"
        static let Testing = ""
        static let Production = ""
    }
    
    struct API {
        
        #if TEMPLATE_PLATFORM_TESTING
        static let baseURL = Domain.Testing
        #elseif TEMPLATE_PLATFORM_STAGING
        static let baseURL = Domain.Staging
        #elseif TEMPLATE_PLATFORM_PRODUCTION
        static let baseURL = Domain.Production
        #endif
        
        // authentication APIs
        static let RequestAccessToken = baseURL + "/token"
        static let RefreshAccessToken = baseURL + "/refreshtoken"
    }
    
    struct GetNumber {
        static let DefaultNumber = 20
    }
    
    struct Parameter {
        // headers
        static let Accept = "Accept"
        static let ApplicationJson = "application/json"
        static let AccessTokenType = "access-token"
        static let ContentType = "Content-Type"
        static let FormUrlEncoded = "application/x-www-form-urlencoded"
        static let UserNameHeader = "user"
        static let PasswordHeader = "password"
        static let UserNameHeaderValue = "tinngan"
        static let PasswordHeaderValue = "191f1f632d69180e6228d26849d34d081a3b8d8aa9197eba0f70530ffe698ba80108bfb075c43e82081e245ccb63f6a39107327b2c1d053469bdf4f09bc1e820"
        
        // params
    }
    
    // Storyboard identifiers
    struct StoryboardID {
        static let LoginVC = "LoginVC"
    }
    
    // Segue identifier
    struct Segue {
        static let unwindToLogin = "unwindToLoginVC"
    }
    
    // UserDefaults Keys
    struct UserDefaultsKey {
        static let AccessToken = "AccessToken"
        static let IsDarkMode = "IsDarkMode"
    }
    
    struct Message {
        static let LoginAgain = "You are logged into your account on another device. Please login again."
        static let NoHistoryToShow = "No history to show"
    }
    
    struct Notification {
        static let ChangeDarkMode = "ChangeDarkMode"
    }
    
    struct HttpErrorCode {
        static let Unauthorized = 401
    }
    
    static let dateFormat = "yyyy-MM-dd"
    
    struct BarButton {
        static let Width = CGFloat(40)
        static let Height = CGFloat(40)
    }
    
    struct Font {
        static let CORETEXT_FONT_NAME = "HelveticaNeue"
        static let CORETEXT_LIGHT_FONT_NAME = "HelveticaNeue-Light"
        static let CORETEXT_BOLD_FONT_NAME = "HelveticaNeue-Bold"
        static let CORETEXT_MEDIUM_FONT_NAME = "HelveticaNeue-Medium"
        static let NavigationFont = UIFont.init(name: CORETEXT_BOLD_FONT_NAME, size: 14)
        static let BoldFont = UIFont.boldSystemFont(ofSize: 14)
        static let NormalFont = UIFont.systemFont(ofSize: 14)
    }
    
    struct Color {
        static let BackgroundColor = UIColor(red: 37.0/255.0, green: 37.0/255.0, blue: 37.0/255.0, alpha: 1.0)
    }
    
    struct ScreenSize {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    }
    
}
