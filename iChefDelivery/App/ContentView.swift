//
//  ContentView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 10/11/25.
//

import SwiftUI

struct ContentView: View {
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
            fetchData()
        }
    }
    
    // MARK: - Methods
    func fetchData() {
        guard let url = URL(string: "https://private-9d965-antonioxavier.apiary-mock.com/home") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
            }
        }.resume()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
