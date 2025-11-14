//
//  CarouselTabView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 13/11/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    let orders = ordersCarouselMock
    
    var body: some View {
        TabView {
            ForEach(orders) { item in
                CarouselItemView(order: item)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    CarouselTabView()
}
