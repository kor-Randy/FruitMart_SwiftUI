//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/17.
//

import SwiftUI

struct FavoriteButton: View {
    @EnvironmentObject private var store: Store
    let product: Product
    
    private var imageName: String{
        product.isFavorite ? "heart.fill" : "heart"
    }
    
    var body: some View {
        Button(action:{
            self.store.toggleFavorite(of: self.product)
        }){
            Image(systemName: imageName)
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
            //네비게이션 링크보다 FavoriteButton이 먼저 동작하는 방법(2)
                .onTapGesture {
                    self.store.toggleFavorite(of: self.product)
                }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(product: productSamples[0])
            .environmentObject(Store())
    }
}
