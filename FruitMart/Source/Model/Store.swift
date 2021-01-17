//
//  Store.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import Foundation

final class Store: ObservableObject {
    //특정 상품의 데이터가 변경되면, 된련된 뷰들이 모두 알아채고 화면을 올바르게 갱신하기 위함
    @Published var products: [Product]

    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}
