//
//  LoginResponse.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import Foundation

struct LoginResponse: Decodable {
    let token: String
    let expiresAt: String
    let attachmentToken: String
}
