//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/05.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
