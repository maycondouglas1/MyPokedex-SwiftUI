//
//  SplashView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 21/07/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("BlueDark")
            Image("logoPokedex")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
