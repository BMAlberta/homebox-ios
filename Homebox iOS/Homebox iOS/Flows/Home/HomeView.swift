//
//  HomeView.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Home View")
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
