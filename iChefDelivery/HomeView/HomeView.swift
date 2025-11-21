//
//  HomeView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 21/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack {
            Text("iChef Delivery!")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .foregroundColor(Color("ColorRed"))
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
            
            Text("Peça as suas comidas no conforto da sua casa")
                .font(.title2)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(.black.opacity(0.7))
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
            
            Spacer()
        }
        .onAppear
        {
            withAnimation(.easeInOut(duration: 1.5)) {
                isAnimating = true
            }
            
        }
    }
}

#Preview {
    HomeView()
}
