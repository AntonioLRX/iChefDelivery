//
//  ProductDetailHeaderView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 20/11/25.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    
    let product: ProductType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 20)
            
            Text(product.name)
                .font(.title)
                .bold()
                .padding(.horizontal)
                .padding(.top)
            
            Text(product.description)
                .padding(.horizontal)
            
            Text(product.formattedPrice)
                .font(.title3)
                .bold()
                .padding(.horizontal)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductDetailHeaderView(product: productsItemMock)
}
