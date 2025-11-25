//
//  ProductType.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 16/11/25.
//

import Foundation

struct ProductType: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}
