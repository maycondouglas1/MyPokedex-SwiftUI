//
//  SignUpViewModel.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 23/07/24.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailValid: Bool = false
    @Published var isPasswordValid: Bool = false
    @Published var isUsernameValid: Bool = false
    @Published var emailFocused: Bool = false
    @Published var isSecureField: Bool = true
    @Published var username: String = ""
    var cancellables =  Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    private func setupBindings() {
        $email
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { email in
                self.isEmailValid = self.isValidEmail(email: email)
            }.store(in: &cancellables)
        
        $password
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { password in
                self.isPasswordValid = self.isValidPassword(password: password)
            }.store(in: &cancellables)
        
        $username
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { username in
                self.isUsernameValid = self.isValidUsername(username: username)
            }.store(in: &cancellables)
        
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailPredicate.evaluate(with: email)
    }
    
    private func isValidPassword(password: String) -> Bool {
        return password.count >= 8
    }
    
    private func isValidUsername(username: String) -> Bool {
        return username.count >= 3
    }

    
}
