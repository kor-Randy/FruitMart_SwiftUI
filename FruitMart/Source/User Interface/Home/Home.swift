//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var store: Store
//    let store: Store
    var body: some View {
        // List는 Identifiable 프로토콜 또는 그것을 대체한 id 값을 지정해줘야 함
        // 매번 Product 타입을 다룰 때마다 id를 지정해주기보다는
        // Identifiable 프로토콜을 채택하는 것이 낫다
        // Product.swift에 채택
        // List(store.products, id: \.name)

        NavigationView {
            List(store.products) { product in
                NavigationLink(destination: ProductDetail(product: product)) {
                    ProductRow(product: product)
                        .environmentObject(store)
                }
                // 네비게이션 링크보다 FavoriteButton이 먼저 동작하는 방법(1)
                // buttonStyle() 수식어를 생략하면 그 자식 뷰에서 구현된 버튼보다 먼저 상호 작용 우선권을 가짐
//                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("과일마트")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
//        Preview(source: Home(store: Store()))
        Home()
            .environmentObject(Store())
    }
}
