//
//  ProductDetailButtonView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 20/11/25.
//

import SwiftUI

struct ProductDetailButtonView: View {
    
    var onButtonPress: () -> Void
    
    var body: some View {
        Button(
            action: onButtonPress,
            label: {
                HStack {
                    Image(systemName: "cart")
                    
                    Text("Adicionar ao carrinho")
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .background(Color("ColorRed"))
                .foregroundColor(.white)
                .cornerRadius(32)
                .shadow(color: Color("ColorRedDark").opacity(0.7), radius: 10, x: 6, y:8)
            }
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductDetailButtonView(
        onButtonPress: { print("Botão pressionado") }
    )
    .padding()
}
