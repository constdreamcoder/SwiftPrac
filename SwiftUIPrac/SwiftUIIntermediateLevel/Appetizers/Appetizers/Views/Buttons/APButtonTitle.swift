//
//  APButtonTitle.swift
//  Appetizers
//
//  Created by SUCHAN CHANG on 2023/10/06.
//

import SwiftUI

struct APButtonTitle: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.colorBrandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct APButtonTitle_Previews: PreviewProvider {
    static var previews: some View {
        APButtonTitle(title: "Text Title")
    }
}

// iOS 17 이상
//#Preview {
//    APButtonTitle(title: "Text Title")
//}
