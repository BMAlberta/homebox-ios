//
//  LocationDashboard.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import SwiftUI

struct LocationDashboard: View {
    @StateObject var viewModel: LocationViewModel
    @EnvironmentObject var _session: Session
    var body: some View {
        HStack {
            Text("Location Dashboard")
            Text("Number of locations: \(viewModel.model.count)")
        }
        .onAppear {
            Task {
                await self.viewModel.getLocationTree()
            }
        }
    }
}

struct LocationDashboard_Previews: PreviewProvider {
    
    static var session: Session {
        let session = Session()
        return session
    }
    
    static var previews: some View {
        Group {
            let sampleViewModel = LocationViewModel(Self.session)
            LocationDashboard(viewModel: sampleViewModel)
                .environmentObject(Self.session)
        }
    }
}
