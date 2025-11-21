//
//  StoresContainerView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 14/11/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title: String = "Lojas"
    @State private var ratingFilter: Int = 0
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter && (min...max).contains(store.distance)
        }
    }
    @State var min: Double = 0.0
    @State var max: Double = 100.0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrelas") {
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar Filtro")
                    }
                    Divider()
                    
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
                Menu("Distância") {
                    Button {
                        min = 0.0
                        max = 100.0
                    } label: {
                        Text("Limpar Filtro")
                    }
                    Divider()
                    
                    ForEach(Array(stride(from: 0, through: 25, by: 5)), id:\.self) { number in
                        Button {
                            max = Double(number + 5)
                            min = Double(number)
                        } label: {
                            return Text("de \(Int(number)) até \(Int(number+5)) km")
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
