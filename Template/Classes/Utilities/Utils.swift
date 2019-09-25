import Foundation
import UIKit

class Utils {
    
    static func mDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static func stringClassFromString(_ className: String) -> AnyClass! {
        
        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        /// get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")!;
        
        // return AnyClass!
        return cls;
    }
    
}
