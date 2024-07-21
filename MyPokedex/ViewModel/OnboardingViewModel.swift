//
//  OnboardingViewModel.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 21/07/24.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var currentStep: Int = 0
    @Published var onboargingSteps: [OnboardingStep] = [
        OnboardingStep(title: "Todos os Pokémons em um só Lugar",
                       description: "Acesse uma vasta lista de Pokémon detodas as gerações já feitas pela Nintendo",
                       buttonText: "Continuar"
        ),
        OnboardingStep(title: "Mantenha sua Pokédex atualizada",
                       description: "Cadastre-se e mantenha seu perfil,pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet",
                       buttonText: "Vamos começar!"
        )
    ]
}
