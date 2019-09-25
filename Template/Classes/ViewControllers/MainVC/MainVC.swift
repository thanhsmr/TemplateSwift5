import UIKit
import PromiseKit
import Alamofire

class MainVC: BaseViewController, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "TEST"
        self.showLoading()
    

        AuthManager.requestAccessToken("abc", source: "google").done { token in
            print(token.accessToken)
        }.ensure {
            self.hideLoadingView()
        }.catch { error in
            Log.debug("Error: \(error)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        authRequest?.cancel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
