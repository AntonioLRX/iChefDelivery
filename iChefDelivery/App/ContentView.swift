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
        guard let url = URL(string: "https://private-9d965-antonioxavier.apiary-mock.com/stores") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    else if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data)
                            print(json)
                        } catch {
                            print(error.localizedDescription)
                        }
                        
                    }
                }.resume()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
