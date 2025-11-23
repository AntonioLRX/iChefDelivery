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
    @State private var buttonOffset: CGFloat = 0
    @State private var showSecondScreen: Bool = false
    let buttonHeight: CGFloat = 80
    
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
                        .frame(width: isAnimating ? geometry.size.width : 30)
                    
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
                    
                    ZStack {
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                        
                        Capsule()
                            .fill(Color("ColorRed").opacity(0.2))
                            .padding(8)
                        
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .offset(x: 20)
                            .foregroundColor(Color("ColorRedDark"))
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffset + buttonHeight)
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("ColorRed"))
                                Circle()
                                    .foregroundColor(Color("ColorRedDark"))
                                    .padding(9)
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    if (gesture.translation.width > 0 && buttonOffset <= (geometry.size.width - 60) - buttonHeight) {
                                        withAnimation(
                                            .easeInOut(duration: 0.25)
                                        ) {
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                })
                                .onEnded({ _ in
                                    if(buttonOffset > (geometry.size.width - 60) / 2) {
                                        showSecondScreen = true
                                    }
                                    else {
                                        withAnimation(
                                            .easeInOut(duration: 0.25)
                                        ) {
                                            buttonOffset = 0
                                        }
                                    }
                                })
                        )
                    }
                    .offset(y: isAnimating ? 0 : 100)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                }
                .onAppear
                {
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

#Preview {
    HomeView()
}
