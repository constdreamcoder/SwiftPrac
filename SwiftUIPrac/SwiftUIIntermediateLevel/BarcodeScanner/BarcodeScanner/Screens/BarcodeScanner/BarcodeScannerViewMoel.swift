//
//  BarcodeScannerViewMoel.swift
//  BarcodeScanner
//
//  Created by SUCHAN CHANG on 2023/10/05.
//

import SwiftUI

final class BarcodeScannerViewMoel: ObservableObject {
    
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
}
