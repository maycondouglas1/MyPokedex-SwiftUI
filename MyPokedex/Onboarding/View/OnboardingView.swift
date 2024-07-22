//
//  OnboardingView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 21/07/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            if viewModel.showSplash {
                SplashView()
            } else {
                onboardingTabView
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.viewModel.showSplash = false
                }
            }
        }
    }
    
    var onboardingTabView: some View {
        NavigationView {
            TabView(selection: $viewModel.currentStep) {
                ForEach(Array(viewModel.onboargingSteps.enumerated()), id: \.offset) {
                    index, step in
                    VStack {
                        trainerImages(stepIndex: index)
                        Spacer().frame(height: 45)
                        titleAndDescription(
                            title: step.title,
                            description: step.description
                        )
                        Spacer().frame(height: 48)
                        continueButton(buttonText: step.buttonText)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                           maxHeight: .infinity,
                           alignment: .bottom
                    )
                    .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay {
                onboardingProgress
            }
        }
    }
    
    @ViewBuilder
    func trainerImages(stepIndex: Int) -> some View {
        if stepIndex == 0 {
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
        } else {
            Image("trainerHilda")
                .background {
                    Image("shadowTrainerHilda")
                        .offset(x: -15, y: 120)
                }
        }
        
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            
            Text(description)
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var onboardingProgress: some View {
        HStack {
            ForEach(viewModel.onboargingSteps.indices, id: \.self) {
                index in
                Capsule()
                    .frame(
                        width: viewModel.currentStep == index ? 28 : 9,
                        height: 9
                    )
                    .foregroundStyle(
                        Color(viewModel.currentStep == index ? "Blue" : "Secondary")
                    )
                    .animation(.bouncy, value: viewModel.currentStep)
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .bottom
        )
        .padding(.bottom, 95)
    }
    
    @ViewBuilder
    func continueButton(buttonText: String) -> some View {
        if viewModel.currentStep == 0 {
            Button(action: {
                withAnimation {
                    viewModel.currentStep = 1
                }
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("Blue"))
                    .overlay {
                        Text(buttonText)
                            .foregroundStyle(.white)
                            .font(Font.custom("Poppins-Bold", size: 18))
                    }
                
            })
        } else {
            NavigationLink {
                LoginAndSignUpView()
            } label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("Blue"))
                    .overlay {
                        Text(buttonText)
                            .foregroundStyle(.white)
                            .font(Font.custom("Poppins-Bold", size: 18))
                    }
            }
        }
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
