//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    let store: Store
    var body: some View {
        //List는 Identifiable 프로토콜 또는 그것을 대체한 id 값을 지정해줘야 함
        //매번 Product 타입을 다룰 때마다 id를 지정해주기보다는
        //Identifiable 프로토콜을 채택하는 것이 낫다
        //Product.swift에 채택
        //List(store.products, id: \.name)
        
        List(store.products) { product in
            ProductRow(product: product)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(store: Store())
    }
}
