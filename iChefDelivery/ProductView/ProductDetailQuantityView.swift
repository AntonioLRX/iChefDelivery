//
//  ProductDetailQuantityView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 20/11/25.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @State private var productQuantity: Int = 1
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Quantidade")
                .font(.title3)
                .bold()
            
            HStack {
                Button {
                    if(productQuantity > 1) {
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }.foregroundColor(productQuantity == 1 ? .gray.opacity(0.3) : Color("ColorRed"))
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button {
                    productQuantity+=1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }

            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductDetailQuantityView()
        .padding(20)
}
