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
        ScrollView {
            VStack(spacing: 8) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .font(.title)
                        .bold()
                    Text(product.description)
                        
                    Text(product.formattedPrice)
                        .font(.title3)
                        .bold()
                    
                }.padding(.vertical, 20)
                    .padding(.horizontal, 10)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let productItemPreview = productsItemMock
    ProductDetailView(product: productItemPreview)
}
