//
//  ProductDetailView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 17/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State private var productQuantity: Int = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailButtonView()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductDetailView(product: productsItemMock)
}

//Binding usado na ProductDetailQuantityView é para estabelecer uma ligacao entre
//as duas vars, pra atualizar tanto o valor filho quanto o pai
