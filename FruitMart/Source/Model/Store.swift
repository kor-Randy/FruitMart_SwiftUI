//
//  Store.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import Foundation

final class Store: ObservableObject {
    // 특정 상품의 데이터가 변경되면, 된련된 뷰들이 모두 알아채고 화면을 올바르게 갱신하기 위함
    @Published var products: [Product]
    
    @Published var orders: [Order] = []

    init(filename: String = "ProductData.json") {
        self.products = Bundle.main.decode(filename: filename, as: [Product].self)
    }
}

extension Store {
    func toggleFavorite(of product: Product) {
        // firstIndex(where) -> Equatable 프로토콜을 준수하지 않은 것을 비교하기 위해 where: 사용
        guard let index = products.firstIndex(of: product) else { return }

        products[index].isFavorite.toggle()
    }
    
    func placeOrder(product: Product, quantity: Int){
        let nextID = Order.orderSequence.next()!
        let order = Order(id: nextID, product: product, quantity: quantity)
        orders.append(order)
    }
}
