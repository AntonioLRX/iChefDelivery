//
//  ContentView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 15)
            ScrollView(
                .vertical, showsIndicators: false
            ) {
                VStack(spacing: 20) {
                    OrderTypeGridView()
                    CarouselTabView()
                }
            }
        }
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
