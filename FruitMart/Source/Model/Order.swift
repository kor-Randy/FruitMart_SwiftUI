//
//  Order.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import Foundation

struct Order: Identifiable {
    static var orderSequence = sequence(first: 1) { $0 + 1 } // 처음엔 1부터 1씩 증가
    let id: Int
    let product: Product
    let quantity: Int
    
    var price: Int{
        product.price * quantity
    }
}
