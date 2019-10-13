import UIKit
import JGProgressHUD

class BaseViewController: UIViewController {
    
    let hud = JGProgressHUD(style: .dark)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        configUI()
    }
            
    func configUI() {
        print("=======" + self.description)
//        self.edgesForExtendedLayout = []
        configBackButton()
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


    func configBackButton(){
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
    }
    
    func showAlert(_ message: String, _ title: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showConfirmAlert(_ message: String, _ title: String = "", okAction: @escaping ((UIAlertAction) -> Swift.Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: "Đồng ý", style: UIAlertAction.Style.default, handler: okAction))
        alert.addAction(UIAlertAction(title: "Huỷ", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showMessage(_ message: String, _ title: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showMessage(_ message: String, _ title: String = "", okAction: @escaping ((UIAlertAction) -> Swift.Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler: okAction))
        self.present(alert, animated: true, completion: nil)
    }

    func showAlert(_ message: String, _ title: String = "", _ okTitle: String = "", _ cancelTitle: String = "", okAction: @escaping ((UIAlertAction) -> Swift.Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: okTitle, style: UIAlertAction.Style.default, handler: okAction))
        alert.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showAlert(_ message: String, _ title: String = "", _ okTitle: String = "", _ cancelTitle: String = "", okAction: @escaping ((UIAlertAction) -> Swift.Void), cancelAction: @escaping ((UIAlertAction) -> Swift.Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction.init(title: okTitle, style: UIAlertAction.Style.default, handler: okAction))
        alert.addAction(UIAlertAction(title: cancelTitle, style: UIAlertAction.Style.cancel, handler: cancelAction))
        self.present(alert, animated: true, completion: nil)
    }

    func showLoading(inView : UIView) {
        DispatchQueue.main.async {
            self.hud.show(in: inView)
        }
    }

    func showLoading() {
        DispatchQueue.main.async {
            self.hud.show(in: self.view)
        }
    }

    func showLoadingInView(_ inView: UIView) {
        DispatchQueue.main.async {
            self.hud.show(in: inView)
        }
    }

    func hideLoading() {
        hud.dismiss()
    }
    
}
extension BaseViewController: ResponseUIViewController {}
