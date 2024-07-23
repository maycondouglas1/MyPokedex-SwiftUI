//
//  SignUpEmailView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 23/07/24.
//

import SwiftUI

struct SignUpEmailView: View {
    @StateObject var viewModel: SignUpViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack {
            titles
            passwordField
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(HeaderView(title: "Criar conta"))
    }
    
    var titles: some View {
        VStack {
            Text("Vamos começar!")
                .font(Font.custom("Poppins-Regular", size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
            Text("Qual é o seu e-mail?")
                .font(Font.custom("Poppins-Bold", size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
        }
    }
    
    var passwordField: some View {
        VStack{
            TextField("E-mail", text: $viewModel.email)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .focused($isFocused)
                .padding()
                .font(Font.custom("Poppins-regular", size: 16))
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2.0)
                        .frame(height: 52)
                        .foregroundStyle(isFocused ? Color("Primary") : Color(.lightGray))
                }
            
            Text("Use um endereço de e-mail válido.")
                .font(Font.custom("Poppins-Regular", size: 12))
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            SignUpPasswordView(viewModel: self.viewModel)
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(viewModel.isEmailValid ? Color("Blue") : Color(.lightGray))
                .overlay {
                    Text("Continuar")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(Color(.white))
                }
        }
        .disabled(!viewModel.isEmailValid)
    }
}

#Preview {
    SignUpEmailView(viewModel: SignUpViewModel())
}
