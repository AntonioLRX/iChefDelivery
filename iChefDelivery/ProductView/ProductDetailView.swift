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
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView()
            
            Spacer()
            
            ProductDetailButtonView()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let productItemPreview = productsItemMock
    ProductDetailView(product: productItemPreview)
}
