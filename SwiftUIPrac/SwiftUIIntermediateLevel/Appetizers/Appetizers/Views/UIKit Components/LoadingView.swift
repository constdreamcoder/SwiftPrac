//
//  LoadingView.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/05.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .uiColorBrandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            
//            ActivityIndicator()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .tint(.colorBrandPrimary)
                .scaleEffect(2)
        }
    }
}
