//
//  StoreItemView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 14/11/25.
//

import SwiftUI

struct StoreItemView: View {
    
    let store: StoreType
    
    var body: some View {
        HStack {
            Image(store.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            Text(store.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let storePreview = storesItemMock
    
    StoreItemView(store: storePreview)
        .padding()
}
