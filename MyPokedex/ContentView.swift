//
//  ContentView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 20/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("trainer1")
                    .offset(x: -65)
                    .background {
                        Image("shadowTrainer1")
                            .offset(x: -65, y: 110)
                    }
                Image("trainer2")
                    .offset(x: 50,y: -10)
                    .background {
                        Image("shadowTrainer2")
                            .offset(x: 50, y: 115)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
