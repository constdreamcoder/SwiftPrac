//
//  Date+Ext.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/06.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var onHundreTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
