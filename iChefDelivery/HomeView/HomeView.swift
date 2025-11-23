//
//  HomeView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 21/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating: Bool = false
    @State private var showSecondScreen: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                HomeCircleView(
                    isAnimating: $isAnimating,
                )
                
                HomeCircleView(
                    isAnimating: $isAnimating,
                    startX: geometry.size.width + 50,
                    startY: geometry.size.height + 50,
                    endX: geometry.size.width - 50,
                    endY: geometry.size.height - 50
                )
                
                VStack {
                    HomeHeaderView(
                        isAnimating: $isAnimating,
                        width: geometry.size.width
                    )
                    HomeButtonView(
                        showSecondScreen: $showSecondScreen,
                        isAnimating: $isAnimating,
                        width: geometry.size.width
                    )
                }.onAppear {
                    withAnimation(.easeInOut(duration: 3)) {
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondScreen) {
                ContentView()
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeView()
        .padding()
}
