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
        TabView(selection: $viewModel.currentStep) {
            ForEach(0..<viewModel.onboargingSteps.count, id: \.self) {
                index in
                VStack {
                    trainerImages
                    Spacer().frame(height: 45)
                    titleAndDescription(
                        title: viewModel.onboargingSteps[index].title,
                        description: viewModel.onboargingSteps[index].description
                    )
                    Spacer().frame(height: 24)
                    onboardingProgress
                    Spacer().frame(height: 45)
                    continueButton(buttonText: viewModel.onboargingSteps[index].buttonText)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, 
                       maxHeight: .infinity,
                       alignment: .bottom
                )
            .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    @ViewBuilder
    var trainerImages: some View {
        if viewModel.currentStep == 0 {
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
        }
       
    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack(spacing: 16) {
            Text(viewModel.onboargingSteps[viewModel.currentStep].title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            
            Text(viewModel.onboargingSteps[viewModel.currentStep].description)
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var onboardingProgress: some View {
        HStack {
            if viewModel.currentStep == 0 {
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("Blue"))
                
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
            } else {
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
                
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundStyle(Color("Blue"))
        
            }
            
        }
    }
    
    func continueButton(buttonText: String) -> some View {
        Button(action: {
            viewModel.currentStep = 1
        }, label: {
           Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundStyle(Color("Blue"))
                .overlay {
                    Text(viewModel.onboargingSteps[viewModel.currentStep].buttonText)
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-Bold", size: 18))
                }
                
        })
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
