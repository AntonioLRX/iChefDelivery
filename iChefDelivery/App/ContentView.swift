//
//  ContentView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Attributes
    private var service =  HomeService()
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                    .padding(.horizontal, 15)
                ScrollView(
                    .vertical, showsIndicators: false
                ) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear{
            service.fetchData()
        }
    }
    
    // MARK: - Methods
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
