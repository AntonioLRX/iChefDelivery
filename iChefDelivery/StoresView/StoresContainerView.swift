//
//  StoresContainerView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 14/11/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title: String = "Lojas"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 30) {
                ForEach(storesMock) { item in
                    NavigationLink {
                        StoreDetailView(store: item)
                    } label: {
                        StoreItemView(store: item)
                    }
                }
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StoresContainerView()
}
