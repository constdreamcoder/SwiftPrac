//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by SUCHAN CHANG on 2023/10/02.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
