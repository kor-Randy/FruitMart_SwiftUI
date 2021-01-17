//
//  ProductDetail.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import SwiftUI

struct ProductDetail: View {
    let product: Product
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack(spacing: 0) {
            productImage
            orderView
        }
        .edgesIgnoringSafeArea(.top) // 기본적으로 뷰는 SafeArea를 기준으로 레이아웃이 구성되지만, 지정한 방향의 안전 영역을 무시할 수 있음
    }
    
    var productImage: some View {
        // 이미지가 사진마다 제각각이어서 GR로 감싼다
        GeometryReader { _ in
            Image(self.product.imageName)
                .resizable()
                .scaledToFill()
        }
    }
    
    var orderView: some View {
        GeometryReader { gr in
            VStack(alignment: .leading) {
                self.productDescription
                Spacer()
                self.priceInfo
                self.placeOrderButton
            }
            // 지오메트리 리더가 차지하는 뷰의 높이보다 VStack의 높이가 10 크게
            .frame(height: gr.size.height + 10)
            .padding(32)
            .background(Color.white) // 다크모드에서도 흰색 배경을 사용
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5)
        }
    }
    
    var productDescription: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                // 상품명
                Text(product.name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Spacer()
                
                // 즐겨찾기 버튼
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(Color.peach)
                    .frame(width: 32, height: 32)
            }
            // 상품 설명, 아래 내용 참고
            Text(splitText(product.description))
                .foregroundColor(.secondaryText)
                .fixedSize() // 뷰의 크기가 작아져도 텍스트가 생략되지 않고 표시
        }
    }
    
    var priceInfo: some View {
        let price = quantity * product.price
        
        return HStack {
            Text("$\(price)").font(.title)
                .fontWeight(.medium)
            Spacer()
            QuantitySelector(quantity: $quantity)
        }
        .foregroundColor(.black)
    }
    
    var placeOrderButton: some View {
        Button(action: {}) {
            Capsule()
                .fill(Color.peach)
                // 너비는 주어진 공간을 최대로 사용하고 높이는 최소, 최대치 지정
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 55)
                .overlay(Text("주문하기")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white))
                .padding(.vertical, 8)
        }
    }
    
    // 한 문장으로 길게 구성된 상품 설명 문장을 적절하게 두줄로 나누어주는 기능
    // ex) "아이들이 너무나 좋아하는 시원하고 달콤한 하우스 수박이에요."
    // 라는 문장에서 '시원하고' 에서 '원'이 문장의 절반인데,
    // '원'에서 가장 가까운 " "를 찾아 두 문장으로 나누어 주는 기능
    func splitText(_ text: String) -> String {
        guard !text.isEmpty else { return text }
        
        let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
        let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
            ?? text[centerIdx...].firstIndex(of: " ")
            ?? text.index(before: text.endIndex)
        let afterSpcaIdx = text.index(after: centerSpaceIdx)
        let lhsString = text[..<afterSpcaIdx].trimmingCharacters(in: .whitespaces)
        let rhsString = text[afterSpcaIdx...].trimmingCharacters(in: .whitespaces)
        return String(lhsString + "\n" + rhsString)
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(product: productSamples[2])
    }
}
