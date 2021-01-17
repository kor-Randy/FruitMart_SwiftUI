//
//  ColorExtension.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/05.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // scanString() -> iOS 13 부터 지원 #문자 제거
        
        var rgb: UInt64 = 0
        // 문자열을 Int64로 변환하여 저장
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb>>16) & 0xFF) / 255.0
        let g = Double((rgb>>8) & 0xFF) / 255.0
        let b = Double((rgb>>0) & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
    
    static let peach = Color("peach") // 메인 색상
    static let primaryShadow = Color.primary.opacity(0.2) // 그림자에 사용할 색
    static let secondaryText = Color(hex: "#6e6e6e") // 생성자를 이용하여 새로운 색을 추가
    static let cyan = Color(UIColor.cyan) // UIColor 사용
    static let background = Color(UIColor.systemGray6)
}
