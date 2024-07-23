//
//  SignUpPasswordView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 23/07/24.
//

import SwiftUI

struct SignUpPasswordView: View {
    @StateObject var viewModel: SignUpViewModel
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack {
            titles
            emailField
            Spacer()
            continueButton
        }
        .padding()
        .navigationBarBackButtonHidden()
        .modifier(HeaderView(title: "Criar conta"))
    }
    
    var titles: some View {
        VStack {
            Text("Agora...")
                .font(Font.custom("Poppins-Regular", size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
            Text("Crie uma senha")
                .font(Font.custom("Poppins-Bold", size: 26))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false , vertical: true)
        }
    }
    
    var emailField: some View {
        VStack {
            Group {
                if viewModel.isSecureField {
                    SecureField("Senha", text: $viewModel.password)
                } else {
                    TextField("Senha", text: $viewModel.password)
                }
            }
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding()
            .font(Font.custom("Poppins-regular", size: 16))
            .focused($isFocused)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 2.0)
                    .frame(height: 52)
                    .foregroundStyle(isFocused ? Color("Primary") : Color(.lightGray))
            }
            .overlay(alignment:.trailing ) {
                Image(systemName: viewModel.isSecureField ? "eye" : "eye.slash")
                    .padding()
                    .onTapGesture {
                        viewModel.isSecureField.toggle()
                    }
            }
            
            Text("Sua senha deve ter pelo menos 8 caracteres")
                .font(Font.custom("Poppins-Regular", size: 12))
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var continueButton: some View {
        NavigationLink {
            SignUpUsernameView(viewModel: self.viewModel)
        } label: {
            Capsule()
                .frame(height: 58)
                .foregroundStyle(viewModel.isPasswordValid ? Color("Blue") : Color(.lightGray))
                .overlay {
                    Text("Continuar")
                        .font(Font.custom("Poppins-Bold", size: 18))
                        .foregroundStyle(Color(.white))
                }
        }
        .disabled(!viewModel.isPasswordValid)
    }
}

#Preview {
    SignUpPasswordView(viewModel: SignUpViewModel())
}
