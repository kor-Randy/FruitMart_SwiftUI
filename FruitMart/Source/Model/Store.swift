//
//  Store.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import Foundation

final class Store {
    var products: [Product]

    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
