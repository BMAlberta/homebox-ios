//
//  AuthServiceStore.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import Foundation
import Combine

enum AuthServiceError: Error {
    case networkError
    case urlError
    case invalidUrlRequest
    case decoder(error: Error)
}


actor AuthServiceStore {
    
    static func performLogin(_ credentials: Credentials) async throws -> LoginResponse {
        let urlString = "http://cluster01.ad.bmalberta.com:3100/api/v1/users/login"
        
        
        guard let url = URL(string: urlString) else {
            throw AuthServiceError.urlError
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        let data : Data = "username=\(credentials.username)&password=\(credentials.password)".data(using: .utf8)!
        request.httpBody = data
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 400 || httpResponse.statusCode == 200 else {
                throw AuthServiceError.networkError
            }
            
            let decoder = JSONDecoder()
            let rawData = try decoder.decode(LoginResponse.self, from: data)
            
            return rawData
            
        } catch {
            throw AuthServiceError.decoder(error: error)
        }
        
    }
}
