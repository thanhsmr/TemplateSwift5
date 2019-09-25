//
//  AuthTopProtocols.swift
//  Abiding
//
//  Created by thanh bv on 12/7/18.
//  Copyright © 2018 Abiding. All rights reserved.
//

import Foundation

protocol LoginPTVProtocol {
    func loginSuccess(data: LoginResponse)
    func loginError(error: Error)
}

protocol LoginVTPProtocol {
    var view: LoginPTVProtocol? {get set}
    var interector: LoginPTIProtocol? {get set}
    var router: LoginPTRProtocol? {get set}
    
    func loginByEmail(email: String, password: String)
}

protocol LoginPTIProtocol {
    var presenter: LoginITPProtocol? {get set}
    
    func loginByEmail(email: String, password: String)
}

protocol LoginITPProtocol {
    func loginSuccess(data: LoginResponse)
    func loginError(error: Error)
}

protocol LoginPTRProtocol {
    static func createModule() -> BaseViewController
}
