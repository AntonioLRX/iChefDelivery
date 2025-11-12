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
            Image(systemName: "star")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("My first class!")
            Button {
                print("clicado")
            } label: {
                Text("Clica em mim🫦".uppercased()).font(.caption2).padding(.all)
                
            }.background(.white).cornerRadius(CGFloat(6)).buttonBorderShape(.circle).border(Color.gray)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}

#Preview(traits: .sizeThatFitsLayout, body: {
    ContentView()
})
