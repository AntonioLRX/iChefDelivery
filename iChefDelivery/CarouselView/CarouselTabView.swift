//
//  CarouselTabView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 13/11/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    let orders = ordersCarouselMock
    @State private var currentIndex = 1
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(orders) { item in
                CarouselItemView(order: item)
                    .tag(item.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear {
            Timer.scheduledTimer(
                withTimeInterval: 3,
                repeats: true
            ) { _ in
                withAnimation(.easeInOut(duration: 1)) {
                    if(currentIndex > orders.count) {
                        currentIndex = 1
                    }
                    currentIndex += 1
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CarouselTabView()
        .padding()
}
