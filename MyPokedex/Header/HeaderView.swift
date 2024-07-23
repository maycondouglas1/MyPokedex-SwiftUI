//
//  HeaderView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 22/07/24.
//

import SwiftUI

struct HeaderView: View {
    var title: String
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        var body: some View {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .tint(Color("Primary"))
                        .padding()
                }
                
                Spacer()
                
                Text(title)
                    .font(Font.custom("Poppins-Bold", size: 18))
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.left")
                    .opacity(0)
                    .padding()
                    .foregroundStyle(Color("Primary"))
            }
            .background(Color.white)
        }
}

#Preview {
    HeaderView(title: "Criar conta")
}
