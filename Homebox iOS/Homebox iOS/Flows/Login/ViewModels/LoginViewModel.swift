//
//  LoginViewModel.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    
    private var _session: Session
    
    init(_ session: Session) {
        _session = session
    }
    
    
    @MainActor
    func doLogin() async {
        let localCredentials = Credentials(username: self.username, password: self.password)
        await doLogin(withCredentials: localCredentials)
    }
    
    @MainActor
    func doLogin(withCredentials credentials: Credentials) async {
        let suppliedCredentials = credentials
        
        do {
            let loginResponse = try await AuthServiceStore.performLogin(suppliedCredentials)
            print(loginResponse)
            _session.updateSessionConfiguration(withAuthorizationHeader: loginResponse.token)
            _session.sessionActive = true
        } catch {
            print(error)
        }
    }
}
