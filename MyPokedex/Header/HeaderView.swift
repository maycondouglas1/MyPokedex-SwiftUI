//
//  HeaderView.swift
//  MyPokedex
//
//  Created by Maycon Douglas on 22/07/24.
//

import SwiftUI
import Foundation

struct HeaderView: ViewModifier {
    @Environment(\.dismiss) var dismiss
    var title: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .tint(Color("Primary"))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(Font.custom("Poppins-Bold", size: 18))
                }
            }
    }
}
