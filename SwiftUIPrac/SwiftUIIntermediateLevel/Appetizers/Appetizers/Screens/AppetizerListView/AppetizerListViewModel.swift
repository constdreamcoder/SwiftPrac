//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/05.
//

import Foundation

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers {[weak self] result in
//            guard let weakSelf = self else { return }
//            
//            DispatchQueue.main.async {
//                weakSelf.isLoading = false
//                
//                switch result {
//                case .success(let appetizers):
//                    weakSelf.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidResponse:
//                        weakSelf.alertItem = AlertContext.invalidResponse
//                    case .invalidURL:
//                        weakSelf.alertItem = AlertContext.invalidURL
//                    case .invalidData:
//                        weakSelf.alertItem = AlertContext.invalidData
//                    case .unableToComplete:
//                        weakSelf.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//            
//        }
//    }
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                isLoading = false
            }
        }
        
    }
}
