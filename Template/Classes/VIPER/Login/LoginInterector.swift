//
//  LoginInterector.swift
//  Abiding
//
//  Created by thanh bv on 12/7/18.
//  Copyright © 2018 Abiding. All rights reserved.
//

import Foundation

class LoginInterector: LoginPTIProtocol {
    var presenter: LoginITPProtocol?
    
    func loginByEmail(email: String, password: String) {
//        let rq = LoginAPIRequest.init(email: email, pass: password)
//        let _ = APILoginClient().send(apiRequest: rq, completion: { (response: LoginResponse) in
//            self.presenter?.loginSuccess(data: response)
//        }) { (error) in
//            self.presenter?.loginError(error: error)
//        }
    }
}
