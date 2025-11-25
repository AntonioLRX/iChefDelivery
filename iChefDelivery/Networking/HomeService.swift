//
//  HomeService.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 24/11/25.
//

import Foundation


struct HomeService {
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
