//
//  LoginAndSignUpView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 22/07/24.
//

import SwiftUI

struct LoginAndSignUpView: View {
    var body: some View {
        VStack(spacing: 35) {
            jumpButton
            Spacer()
            trainerImages
            titleAndDescription
            buttons
        }
        .navigationBarBackButtonHidden()
        .padding()
    }
    
    var jumpButton: some View {
        Button(action: {
            print("teste")
        }, label: {
            HStack {
                Text("Pular")
                    .font(Font.custom("Poppins-Medium", size: 18))
                    .foregroundStyle(Color("Primary"))
                Image(systemName: "arrow.right")
                    .foregroundStyle(Color("Primary"))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        })
        
    }
    
    var trainerImages: some View {
        ZStack {
            Image("trainerHatsune")
                .offset(x: -60)
                .background {
                    Image("shadowHatsune")
                        .offset(x: -70, y: 100)
                }
            Image("trainerHilbert")
                .offset(x: 60, y: -10)
                .background {
                    Image("shadowHilbert")
                        .offset(x: 70, y: 110)
                }
        }
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Está pronto para essa aventura?")
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
                .fixedSize(horizontal: false , vertical: true)
            
            Text("Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!")
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
                .fixedSize(horizontal: false , vertical: true)
        }
    }
    
    var createAccountButton: some View {
        NavigationLink {
            SignUpView()
        } label: {
            Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("Blue"))
                .overlay {
                    Text("Criar conta")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(Color(.white))
                }
        }
    }
    
    var haveAccountButton: some View {
        NavigationLink {
            Text("Teste")
        } label: {
            Text("Já tenho uma conta")
                .font(Font.custom("Poppins-Bold", size: 18))
                .foregroundStyle(Color("Blue"))
                .frame(height: 58)
        }
    }
    
    var buttons: some View {
        VStack {
            createAccountButton
            haveAccountButton
        }
    }
}

#Preview {
    LoginAndSignUpView()
}
