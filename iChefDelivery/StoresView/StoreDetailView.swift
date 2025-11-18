//
//  StoreDetailView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 16/11/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    var titleProducts: String = "Produtos"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                
                Text(titleProducts)
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack(spacing: 8) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(product.name)
                                        .bold()
                                    Text(product.description)
                                        .foregroundColor(.black.opacity(0.5))
                                        .multilineTextAlignment(.leading)
                                    Text(product.formattedPrice)
                                        .bold()
                                }
                                Spacer()
                                
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(12)
                                    .frame(width: 120, height: 120)
                                    .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
                            }
                        }
                        .padding()
                        .foregroundColor(.black)
                    }
                }
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem (
                    placement: .navigationBarLeading,
                    content: {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "cart")
                                Text("Lojas")
                            }
                            .foregroundColor(Color("ColorRed"))
                        }
                    }
                )
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let storePreview = storesItemMock
    StoreDetailView(store: storePreview)
}
