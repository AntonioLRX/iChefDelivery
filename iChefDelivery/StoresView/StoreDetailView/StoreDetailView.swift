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
    //@Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductsView(
                    title: titleProducts,
                    products: store.products,
                )
            }
            .navigationTitle(store.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem (
                    placement: .navigationBarLeading,
                    content: {
                        Button {
                            //dismiss()
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

//@Environment(\.presentationMode) “injeta” o PresentationMode dessa
//view, permitindo controlar a apresentação (fechar a view, por
//exemplo)

//presentationMode.wrappedValue.dismiss() pede para fechar/voltar a
//view atual.

//IOS+15 pode-se usar: @Environment(\.dismiss) var dismiss +
//dismiss().
