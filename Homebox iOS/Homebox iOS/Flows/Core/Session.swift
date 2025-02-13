//
//  Session.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import Foundation
import Combine

class Session: ObservableObject {
    @Published var sessionActive = false
    
    
    
    var sessionConfiguration = URLSessionConfiguration.default
//
    
//    var sessionConfiguration: URLSessionConfiguration {
//        var config = URLSessionConfiguration.default
//        config.httpAdditionalHeaders = [:]
//        return config
//    }
    
    func updateSessionConfiguration(withAuthorizationHeader authHeader: String) {
        self.sessionConfiguration.httpAdditionalHeaders = ["Authorization" : authHeader]
    }
    
}
