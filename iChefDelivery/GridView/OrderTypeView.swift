//
//  OrderTypeView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 12/11/25.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: OrderType
    
    var body: some View {
        VStack(
            spacing: 5,
        ) {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .fixedSize(horizontal: false, vertical: true)
            Text(orderType.name).font(.system(size: 10))
        }
        .frame(width: 70, height: 100)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let orderPreview: OrderType = ordersMock[0]
    OrderTypeView(
        orderType: orderPreview
    )
}
