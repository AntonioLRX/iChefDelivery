//
//  HomeView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 21/11/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ? 50 : -50,
                        y: isAnimating ? 100 : -100,
                    )
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                        y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50,
                    )
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack {
                    Text("iChef Delivery!")
                        .font(.system(size: isAnimating ? 40 : 0))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorRed"))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                        .frame(width: isAnimating ? geometry.size.width :  geometry.size.width - 30)
                    
                    Text("Peça as suas comidas no conforto da sua casa")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                        .frame(width: isAnimating ? geometry.size.width : 30)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(32)
                        .offset(
                            x: imageOffset.width,
                            y: imageOffset.height
                        )
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    imageOffset = gesture.translation
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                })
                        )
                }
                .onAppear
                {
                    withAnimation(.easeInOut(duration: 4)) {
                        isAnimating = true
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
