//
//  LoginViewController.swift
//  Abiding
//
//  Created by SMR on 12/7/18.
//  Copyright © 2018 Abiding. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var presenter : LoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    
}
extension LoginViewController : LoginPTVProtocol {
    func loginSuccess(data: LoginResponse) {
    }
    
    func loginError(error: Error) {

    }
}
