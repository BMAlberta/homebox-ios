//
//  LocationServiceStore.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/26/24.
//

import Foundation
import Combine

enum LocationServiceError: Error {
    case networkError
    case urlError
    case invalidUrlRequest
    case decode(error: Error)
}

actor LocationServiceStore {
    
    static func getLocationTree(session: Session) async throws -> LocationTreeModel {
        let urlString = ConfigurationManager.getUrl(forKey: .locationTree)
        print(urlString)
        guard let url = URL(string: urlString) else {
            throw LocationServiceError.urlError
        }
        
        var request = NetworkUtility.createBaseRequest(url: url, method: .get)
        do {
            let (data, response) = try await URLSession(configuration: session.sessionConfiguration).data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw LocationServiceError.networkError
            }
            print(httpResponse.statusCode)
            let decoder = JSONDecoder()
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            let model = try decoder.decode(LocationTreeModel.self, from: data)
            
            return model
        } catch {
            throw LocationServiceError.decode(error: error)
        }
    }
}
