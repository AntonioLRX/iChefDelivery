//
//  ProductDetailView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 17/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 20)
                
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                
                Text(product.description)
                    .padding(.horizontal)
                
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }
            Spacer()
            
            Button(
                action: {
                    print("O botão foi pressionado!")
                },
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
                })
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let productItemPreview = productsItemMock
    ProductDetailView(product: productItemPreview)
}
