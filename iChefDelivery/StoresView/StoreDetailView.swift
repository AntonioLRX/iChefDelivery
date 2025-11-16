//
//  StoreDetailView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 16/11/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    var contador: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
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
            
            Text("Produtos")
                .font(.title2)
                .bold()
                .padding()
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let storePreview = storesItemMock
    StoreDetailView(store: storePreview)
}
