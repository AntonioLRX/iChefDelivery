//
//  StoreDetailView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 16/11/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: OrderType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let storePreview = storesItemMock
    StoreDetailView(store: storePreview)
}
