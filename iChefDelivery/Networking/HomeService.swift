//
//  HomeService.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 24/11/25.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-9d965-antonioxavier.apiary-mock.com/home") else { return .failure(.invalidURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
}

// Old
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            else if let data = data {
//                let storesObjects = try? JSONDecoder().decode([StoreType].self, from: data)
//            }
//        }.resume()
