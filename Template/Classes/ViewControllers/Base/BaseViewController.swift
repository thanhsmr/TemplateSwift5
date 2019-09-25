import UIKit

class BaseViewController: UIViewController {
    
    var errorView : UIView?
    var baseLoadingView : UIView?
    var lbErrorView : UILabel?
    var imageError : UIImageView?
    var tapErrorLabelGesture : UITapGestureRecognizer?
    var indicatorView: UIActivityIndicatorView?
    var isFakeNavigationBar = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
//    func showLoadingView() {
//        if let vLoading = self.baseLoadingView {
//            if let _ = vLoading.superview {
//
//            } else {
//                self.view.addSubview(vLoading)
//            }
//        } else {
//            self.baseLoadingView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - ( Utils.mDelegate().tabbarIsHidden() ? 0 : 49) - 20))
//            indicatorView = UIActivityIndicatorView.init(frame: CGRect.init(x: self.view.frame.size.width/2 - 15, y: (self.baseLoadingView?.frame.size.height)!/2 - 15, width: 30, height: 30))
//            indicatorView?.startAnimating()
//            self.baseLoadingView?.addSubview(indicatorView!)
//            self.view.addSubview(self.baseLoadingView!)
//        }
//    }
    
    func hideLoadingView() {
        if let vLoading = self.baseLoadingView {
            vLoading.removeFromSuperview()
        }
    }
    
}

extension BaseViewController: ResponseUIViewController {}
