//
//  Object.swift
//  Valixa
//
//  Created by Macbook on 3/9/19.
//  Copyright © 2019 Abiding. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    
    var expiresIn : Int?
    var accessToken : String?
    
    private enum CodingKeys: String, CodingKey {
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }
}
