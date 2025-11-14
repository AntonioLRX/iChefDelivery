//
//  CarouselItemView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 13/11/25.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarouselItemView(order: orderCarouselMock)
        .padding()
}
