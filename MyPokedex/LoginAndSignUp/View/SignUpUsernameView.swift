//
//  SignUpUsernameView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 23/07/24.
//

import SwiftUI

struct SignUpUsernameView: View {
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
            Text("Para finalizar")
                .font(Font.custom("Poppins-Regular", size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
            Text("Qual é o seu nome?")
                .font(Font.custom("Poppins-Bold", size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
        }
    }
    
    var passwordField: some View {
        VStack{
            TextField("Nome", text: $viewModel.username)
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
            
            Text("Esse será o seu nome de usuário no aplicativo.")
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
                .foregroundStyle(viewModel.isUsernameValid ? Color("Blue") : Color(.lightGray))
                .overlay {
                    Text("Continuar")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(Color(.white))
                }
        }
        .disabled(!viewModel.isUsernameValid)
    }
}

#Preview {
    SignUpUsernameView(viewModel: SignUpViewModel())
}
