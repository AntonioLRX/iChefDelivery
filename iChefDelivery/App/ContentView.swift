//
//  ContentView.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Attributes
    private var service =  HomeService()
    private var viewModel = HomeViewModel()
    @State private var storesType: [StoreType] = []
    @State private var isLoading: Bool = true
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack {
                if (isLoading) {
                    ProgressView()
                }
                else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(
                        .vertical, showsIndicators: false
                    ) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear {
            Task {
                await getStores()
            }
            
            getStoresWithAlamofire()
        }
    }
    
    // MARK: - Methods
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        } catch {
            self.isLoading = false
            print(error.localizedDescription)
        }
    }
    
    func getStoresWithAlamofire() {
        service.fetchDataWithAlamofire { stores, error in
            print(stores ?? "")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentView()
}
