//
//  Homebox_iOSApp.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/24/24.
//

import SwiftUI

@main
struct Homebox_iOSApp: App {
    let sessionManager = Session()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sessionManager)
                .onAppear {
                    let appearance = UITabBarAppearance()
                    appearance.configureWithDefaultBackground()
                    UITabBar.appearance().standardAppearance = appearance
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
        }
    }
}
