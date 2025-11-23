//
//  HomeHeaderView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 23/11/25.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var isAnimating: Bool
    @State var imageOffset: CGSize = .zero
    let width: CGFloat
    
    var body: some View {
        Text("iChef Delivery!")
            .font(.system(size: isAnimating ? 48 : 0))
            .fontWeight(.heavy)
            .foregroundColor(Color("ColorRed"))
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
            .padding(isAnimating ? 12 : 92)
        
        Text("Peça as suas comidas no conforto da sua casa")
            .font(.title2)
            .padding()
            .multilineTextAlignment(.center)
            .foregroundColor(.black.opacity(0.7))
        
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -40)
            .frame(width: isAnimating ? width : 30)
        
        Image("image")
            .resizable()
            .scaledToFit()
            .shadow(radius: 60)
            .padding(isAnimating ? 32 : 92)
            .opacity(isAnimating ? 1 : 0)
            .blur(radius: isAnimating ? 0 : 10)
        
            .offset(
                x: imageOffset.width,
                y: imageOffset.height
            )
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            imageOffset = gesture.translation
                        }
                    })
                    .onEnded({ _ in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            imageOffset = .zero
                        }
                    })
            )
    }
}

#Preview {
    HomeHeaderView(
        isAnimating: .constant(true), width: 100
    )
}
