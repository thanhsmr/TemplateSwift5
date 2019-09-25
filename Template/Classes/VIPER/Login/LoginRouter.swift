//
//  AuthTopRouter.swift
//  Abiding
//
//  Created by thanh bv on 12/7/18.
//  Copyright © 2018 Abiding. All rights reserved.
//

import Foundation

class LoginRouter: LoginPTRProtocol {
    static func createModule() -> BaseViewController {
        let view : LoginViewController = LoginViewController.fromNib()
        var presenter: LoginVTPProtocol & LoginITPProtocol = LoginPresenter()
        var interector: LoginPTIProtocol = LoginInterector()
        let router: LoginPTRProtocol = LoginRouter()
        
        view.presenter = presenter as? LoginPresenter
        presenter.view = view
        presenter.interector = interector
        presenter.router = router
        interector.presenter = presenter
        
        return view
    }
    
    
}
