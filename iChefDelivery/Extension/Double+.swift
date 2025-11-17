//
//  Double+.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 16/11/25.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formatted().replacingOccurrences(of: ".", with: ",")
    }
}
