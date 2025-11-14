//
//  DataSourceMock.swift
//  iChefDelivery
//
//  Created by Antonio Lucas Reginaldo Xavier on 12/11/25.
//

import Foundation

let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "Restaurantes", image: "hamburguer"),
    OrderType(id: 2, name: "Mercado", image: "mercado"),
    OrderType(id: 3, name: "Farmácia", image: "farmacia"),
    OrderType(id: 4, name: "Pet", image: "petshop"),
    OrderType(id: 5, name: "Descontos", image: "descontos"),
    OrderType(id: 6, name: "Bebidas", image: "bebidas"),
    OrderType(id: 7, name: "Gourmet", image: "gourmet"),
]

let orderCarouselMock: OrderType = OrderType(id: 1, name: "", image: "barbecue-banner")


let ordersCarouselMock: [OrderType] = [
    OrderType(id: 1, name: "banner burguer", image: "barbecue-banner"),
    OrderType(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
    OrderType(id: 3, name: "banner poke", image: "pokes-banner"),
]

let storesMock: [OrderType] = [
    OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo"),
    OrderType(id: 2, name: "Food court", image: "food-court-logo"),
    OrderType(id: 3, name: "Carbron", image: "carbron-logo"),
    OrderType(id: 4, name: "Padaria", image: "bakery-logo"),
    OrderType(id: 5, name: "Açai Panda", image: "acai-panda-logo"),
]

let storesItemMock: OrderType = OrderType(id: 1, name: "Monstro Burger", image: "monstro-burger-logo")

