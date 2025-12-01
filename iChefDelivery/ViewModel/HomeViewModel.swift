//
//  HomeViewModel.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 30/11/25.
//

import Foundation
import SwiftUI


class HomeViewModel {
    
    private var service = HomeService()
    
    @MainActor
    var onUpdate: (() -> Void)?
    
    private(set) var stores: [StoreType] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    
    func loadStores() {
        Task {
            do {
                let result = try await service.fetchData()
                switch result {
                case .success(let list):
                    self.stores = list
                    print("Sucesso!")
                case .failure(let error):
                    print("Erro ao carregar categorias: \(error)")
                }
            } catch {
                print("Erro inesperado: \(error)")
            }
        }
    }
}
