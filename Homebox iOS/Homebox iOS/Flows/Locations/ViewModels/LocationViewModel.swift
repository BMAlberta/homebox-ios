//
//  LocationViewModel.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/26/24.
//

import Foundation
import Combine

class LocationViewModel: ObservableObject {
    @Published var model: LocationTreeModel = []
    private var _session: Session
    
    init(_ session: Session) {
        _session = session
    }
    
    
    @MainActor
    func getLocationTree() async {
        
        do {
            let locationTree = try await LocationServiceStore.getLocationTree(session: _session)
            self.model = locationTree
            print(locationTree)
        } catch {
            print(error)
        }
    }
}
