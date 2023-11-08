//
//  ContentView.swift
//  LocalNotificationsPrac
//
//  Created by SUCHAN CHANG on 2023/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ContentVieModel()
    
    var body: some View {
        VStack {
            Button("Start Timer") {
                contentViewModel.startTimer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
