//
//  StoreDetailHeaderView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 20/11/25.
//

import SwiftUI

struct StoreDetailHeaderView: View {
    
    let store: StoreType
    
    var body: some View {
        VStack {
            Image(store.headerImage)
                .resizable()
                .scaledToFit()
            HStack {
                Text(store.name)
                    .font(.title)
                    .bold()
                Spacer()
                Image(store.logoImage)
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
            HStack {
                Text(store.location)
                
                Spacer()
                
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: index <= store.stars ? "star.fill" : "star")
                        .foregroundColor(index <= store.stars ? .yellow : .gray)
                        .font(.caption)
                    
                }
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoreDetailHeaderView(store: storesItemMock)
}
