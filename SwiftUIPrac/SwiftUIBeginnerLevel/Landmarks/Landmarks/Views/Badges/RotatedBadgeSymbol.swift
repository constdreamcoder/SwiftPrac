//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by SUCHAN CHANG on 2023/10/03.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}

// iOS 17 이상
//#Preview {
//    RotatedBadgeSymbol(angle: Angle(degrees: 5))
//}
