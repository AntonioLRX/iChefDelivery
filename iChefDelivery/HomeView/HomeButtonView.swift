//
//  HomeButtonView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 23/11/25.
//

import SwiftUI

struct HomeButtonView: View {
    
    @State private var buttonOffset: CGFloat = .zero
    @Binding var showSecondScreen: Bool
    @Binding var isAnimating: Bool
    let buttonHeight: CGFloat = 80
    let width: CGFloat
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color("ColorRed").opacity(0.2))
            
            Capsule()
                .fill(Color("ColorRed").opacity(0.2))
                .padding(8)
            
            Text("Descubra mais")
                .font(.title2)
                .bold()
                .foregroundColor(Color("ColorRedDark"))
                .offset(x: 20)
            
            HStack {
                Capsule()
                    .fill(Color("ColorRed"))
                    .frame(width: buttonOffset + buttonHeight)
                
                Spacer()
            }
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    Circle()
                        .fill(Color("ColorRedDark"))
                        .padding(8)
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24, weight: .bold))
                        .bold()
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .offset(x: buttonOffset)
            .gesture(
                DragGesture()
                    .onChanged({ gesture in
                        if gesture.translation.width > 0 && buttonOffset <= (width - 60) - buttonHeight {
                            withAnimation(
                                .easeInOut(duration: 0.25)
                            ) {
                                buttonOffset = gesture.translation.width
                            }
                        }
                    })
                    .onEnded({ _ in
                        if buttonOffset > (width - 60) / 2 {
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
        .frame(width: width - 60, height: buttonHeight)
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 100)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HomeButtonView(
        showSecondScreen: .constant(false),
        isAnimating: .constant(true),
        width: 400,
    )
    .padding()
}
