//
//  StoresContainerView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 14/11/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title: String = "Lojas"
    @State private var ratingFilter: Int = 5
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Filtrar") {
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if(rating > 1) {
                                return Text("\(rating) estrelas ou mais")
                            }
                            return Text("\(rating) estrela ou mais")
                        }

                    }
                }.foregroundColor(.black)
            }
            
            
            VStack(alignment: .leading, spacing: 30) {
                
                if(filteredStores.isEmpty) {
                    VStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("ColorRed"))
                            .frame(width: 64, height: 64)
                            .padding(.top, 32)
                        
                        Text("Nenhuma loja encontrada para o filtro selecionado.")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color("ColorRed"))
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                    }
                }
                
                ForEach(filteredStores) { item in
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
