//
//  FruitMartApp.swift
//  FruitMart
//
//  Created by 지현우 on 2021/01/14.
//

import SwiftUI

@main
struct FruitMartApp: App {
    var body: some Scene {
        WindowGroup {
            Home(store: Store())
        }
    }
}
