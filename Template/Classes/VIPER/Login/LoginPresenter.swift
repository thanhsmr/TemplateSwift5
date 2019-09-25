//
//  AuthTopPresenter.swift
//  Abiding
//
//  Created by thanh bv on 12/7/18.
//  Copyright © 2018 Abiding. All rights reserved.
//

import Foundation

class LoginPresenter: LoginVTPProtocol {
    var view: LoginPTVProtocol?
    var interector: LoginPTIProtocol?
    var router: LoginPTRProtocol?
    
    func loginByEmail(email: String, password: String) {
        interector?.loginByEmail(email: email, password: password)
    }

}
extension LoginPresenter :LoginITPProtocol {
    func loginSuccess(data: LoginResponse) {
        view?.loginSuccess(data: data)
    }
    
    func loginError(error: Error) {
        view?.loginError(error: error)
    }
}
