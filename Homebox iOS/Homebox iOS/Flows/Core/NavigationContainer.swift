//
//  Navigation.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import SwiftUI

struct NavigationContainer: View {
    @EnvironmentObject var _session: Session
    @State private var showOverlay = false
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            LocationDashboard(viewModel: LocationViewModel(_session))
                .tabItem {
                    Image(systemName: "shippingbox")
                    Text("Locations")
                }
            CreateView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Create")
                }
            ProfileDashboard()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            ToolDashboard()
                .tabItem {
                    Image(systemName: "wrench.and.screwdriver")
                    Text("Tools")
                }
        }
    }
}

struct NavigationContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContainer()
    }
}
