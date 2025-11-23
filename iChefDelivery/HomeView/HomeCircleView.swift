//
//  HomeCircleView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 23/11/25.
//

import SwiftUI

struct HomeCircleView: View {
    
    @Binding var isAnimating: Bool
    let startX: CGFloat
    let startY: CGFloat
    let endX: CGFloat
    let endY: CGFloat
    
    var body: some View {
        Circle()
            .foregroundColor(Color("ColorRed"))
            .frame(width: isAnimating ? 200 : 0)
            .position(
                x: isAnimating ? endX : startX,
                y: isAnimating ? endY : startY,
            )
            .blur(radius: 60)
            .opacity(isAnimating ? 0.5 : 0)
    }
    
    init(
        isAnimating: Binding<Bool>,
        startX: CGFloat = -50,
        startY: CGFloat = -100,
        endX: CGFloat = 50,
        endY: CGFloat = 100
    ) {
        self._isAnimating = isAnimating
        self.startX = startX
        self.startY = startY
        self.endX = endX
        self.endY = endY
    }
}

#Preview {
    HomeCircleView(
        isAnimating: .constant(true),
        startX: 50,
        startY: 100,
        endX: 100,
        endY: 50
    )
}
