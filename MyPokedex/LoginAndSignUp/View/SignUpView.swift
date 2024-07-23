//
//  SignUpView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 22/07/24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        VStack {
            HeaderView(title: "Criar conta")
            Spacer().frame(height: 60)
            trainerImage
            titleAndDescription
            Spacer().frame(height: 32)
            signUpButtons
        }
        .navigationBarBackButtonHidden()
      
    }
    
    var trainerImage: some View {
        ZStack  {
            Image("trainer4")
                .background {
                    Image("shadowTrainer4")
                        .offset(x: 10, y: 125)
                }
        }
    }
    
    var titleAndDescription: some View {
        VStack(spacing: 16) {
            Text("Falta pouco para explorar esse mundo!")
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
            
            Text("Como deseja se conectar?")
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var signUpAppleButton: some View {
           NavigationLink {
               //LoginApple
           } label: {
               Capsule()
                   .stroke(Color(.lightGray), lineWidth: 2)
                   .frame(height: 58)
                   .overlay {
                       HStack(spacing: 16) {
                           Image("appleIcon")
                           Text("Continuar com a Apple")
                               .font(Font.custom("Poppins-Bold", size: 16))
                               .foregroundStyle(Color("Primary"))
                       }
                   }
           }
    }
    
    var signUpGoogleButton: some View {
           NavigationLink {
               //LoginApple
           } label: {
               Capsule()
                   .stroke(Color(.lightGray), lineWidth: 2)
                   .frame(height: 58)
                   .overlay {
                       HStack(spacing: 16) {
                           Image("googleIcon")
                           Text("Continuar com o Google")
                               .font(Font.custom("Poppins-Bold", size: 16))
                               .foregroundStyle(Color("Primary"))
                       }
                   }
           }
    }
    
    var signUpWithEmailButton: some View {
        NavigationLink {
            SignUpView()
        } label: {
            Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("Blue"))
                .overlay {
                    Text("Continuar com um e-mail")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(Color(.white))
                }
        }
    }

    
    var signUpButtons: some View {
        VStack(spacing: 12) {
            signUpAppleButton
            signUpGoogleButton
            signUpWithEmailButton
        }
        .padding(.horizontal)
    }

}

#Preview {
    SignUpView()
}
