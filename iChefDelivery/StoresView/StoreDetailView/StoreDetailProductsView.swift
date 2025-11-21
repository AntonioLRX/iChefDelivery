//
//  StoreDetailProductsView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 20/11/25.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let title: String
    let products: [ProductType]
    
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
                .padding()
            
            ForEach(products) { product in
                Button {
                    selectedProduct = product
                } label: {
                    StoreDetailProductItemView(product: product)
                }.sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreDetailProductsView(
        title: "Produtos", products: productsMock
    )
}
