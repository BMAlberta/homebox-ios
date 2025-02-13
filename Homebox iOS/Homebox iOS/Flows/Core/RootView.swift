//
//  RootView.swift
//  Homebox iOS
//
//  Created by Brian Alberta on 9/25/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var _session: Session
    var body: some View {
        if (!_session.sessionActive) {
            let viewModel = LoginViewModel(_session)
            LoginView(viewModel: viewModel)
        } else {
            NavigationContainer()
                .environmentObject(_session)
        }
    }
}

#Preview {
    RootView()
}

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

