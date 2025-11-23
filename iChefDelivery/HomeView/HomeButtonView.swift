//
//  HomeButtonView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 23/11/25.
//

import SwiftUI

struct HomeButtonView: View {
    
    @State private var buttonOffset: CGFloat = 0
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
                        
                        if (gesture.translation.width > 0 && buttonOffset <= (width - 60) - buttonHeight) {
                            withAnimation(
                                .easeInOut(duration: 0.25)
                            ) {
                                buttonOffset = gesture.translation.width
                            }
                        }
                    })
                    .onEnded({ _ in
                        if(buttonOffset > (width - 60) / 2) {
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
        .frame(width: width - 60, height: buttonHeight)
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
