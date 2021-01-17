//
//  ProductRow.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/05.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack {
            productImage
            productDescription
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 3, x: 2, y: 2)
        .padding(.vertical, 8)
    }
}

private extension ProductRow {
    var productImage: some View {
        // 상품 이미지
        Image(product.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 140)
            .clipped() // Frame 외의 부분 삭제
    }

    var productDescription: some View {
        VStack(alignment: .leading) {
            // 상품명
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            // 설명
            Text(product.description)
                .font(.footnote)
                .foregroundColor(.secondary)

            footerView

        }.padding(12)
    }

    var footerView: some View {
        HStack(spacing: 0) {
            Text("$").font(.footnote)
                + Text("\(product.price)").font(.headline)

            Spacer()

//            Image(systemName: "heart")
//                .imageScale(.large)
//                .foregroundColor(Color.peach)
//                .frame(width: 32, height: 32)
            FavoriteButton(product: product)

            Image(systemName: "cart")
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)

            EmptyView()
        }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productSamples[0])
    }
}
