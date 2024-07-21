//
//  OnboardingView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 21/07/24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            trainerImages
            Spacer().frame(height: 45)
            titleAndDescription
            Spacer().frame(height: 24)
            onboardingProgress
            Spacer().frame(height: 45)
            continueButton
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, 
               maxHeight: .infinity,
               alignment: .bottom
        )
        .padding()
    }
    
    var trainerImages: some View {
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
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Todos os Pokémons em um só Lugar")
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            
            Text("Acesse uma vasta lista de Pokémon detodas as gerações já feitas pela Nintendo")
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var onboardingProgress: some View {
        HStack {
            Rectangle()
                .frame(width: 28, height: 9)
                .clipShape(.capsule)
                .foregroundStyle(Color("Blue"))
            
            Circle()
                .frame(width: 9, height: 9)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    var continueButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
           Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("Blue"))
                .overlay {
                    Text("Continuar")
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-Bold", size: 18))
                }
                
        })
    }
}

#Preview {
    OnboardingView()
}
