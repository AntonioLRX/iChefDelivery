//
//  StoreType.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 16/11/25.
//

import Foundation

struct StoreType: Identifiable, Decodable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
    let distance: Double
    
}
