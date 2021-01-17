//
//  Product.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/05.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: UUID = UUID() // identifiable 프로토콜 준수
    let name: String
    let imageName: String
    let price: Int
    let description: String
    var isFavorite: Bool = false
}

let productSamples = [
    Product(name: "나는야 무화가", imageName: "fig", price: 3100, description: "소화가 잘돼요!!"),
    Product(name: "아보카도", imageName: "avocado", price: 2900, description: "소화가 잘돼요!!"),
    Product(name: "바나나", imageName: "banana", price: 3000, description: "소화가 잘돼요!!"),
    Product(name: "파인애플", imageName: "pineapple", price: 4000, description: "소화가 잘돼요!!"),
    Product(name: "수박", imageName: "watermelon", price: 4500, description: "소화가 잘돼요!!"),
    Product(name: "블루베리", imageName: "blueberry", price: 2000, description: "소화가 잘돼요!!"),
]
