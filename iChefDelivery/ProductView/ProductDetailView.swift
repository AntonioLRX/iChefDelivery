//
//  ProductDetailView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 17/11/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Attributes
    var service =  HomeService()
    let product: ProductType
    @State private var productQuantity: Int = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailButtonView(
                onButtonPress: {
                    Task {
                        await addToCart()
                    }
                }
            )
        }
    }
    
    // MARK: - Methods
    
    func addToCart() async {
        do {
            let result = try await service.confirmCart(
                product: product
            )
            switch result {
            case .success(let message):
                print(message ?? "Erro Inesperado")
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProductDetailView(product: productsItemMock)
}

//Binding usado na ProductDetailQuantityView é para estabelecer uma ligacao entre
//as duas vars, pra atualizar tanto o valor filho quanto o pai
