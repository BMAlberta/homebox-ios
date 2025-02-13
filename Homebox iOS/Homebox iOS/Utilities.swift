//
//  Utilities.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/26/24.
//

import Foundation


struct ConfigurationManager {
    static private let devHost = "http://cluster01.ad.bmalberta.com:3100"
    static private let configHost = "https://content.bmalberta.com"
    static private let BASE_PATH = "/api/v1"
    
    static func getUrl(forKey key: RequestPath) -> String {
//        return Self.stringValue(forKey: "API_SCHEME") +
//        "//" +
//        Self.stringValue(forKey: "BASE_API_HOST") +
//        key.rawValue
        return devHost + BASE_PATH + key.rawValue
        
        
    }
    
    static var configUrl: String {
        return Self.stringValue(forKey: "CONFIG_SCHEME") +
        "//" +
        Self.stringValue(forKey: "CONFIG_API_HOST") +
        "/config.json"
    }
    
    
    enum RequestPath: String {
        case auth = "/users/login"
        case locationTree = "/locations/tree"
    }
    
    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String
        else {
            fatalError("Invalid value or undefined key")
        }
        return value
    }
}

struct NetworkUtility {
    
    enum RequestType: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    static func createBaseRequest(url: URL, method: RequestType) -> URLRequest {
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        return request
    }
}

