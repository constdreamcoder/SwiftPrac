//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/05.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
        .tint(.colorBrandPrimary)
    }
}
struct AppetizerTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
// iOS 17 이상
//#Preview {
//    AppetizerTabView()
//}
