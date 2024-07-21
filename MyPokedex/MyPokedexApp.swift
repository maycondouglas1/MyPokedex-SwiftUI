//
//  MyPokedexApp.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 20/07/24.
//

import SwiftUI

@main
struct MyPokedexApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}
