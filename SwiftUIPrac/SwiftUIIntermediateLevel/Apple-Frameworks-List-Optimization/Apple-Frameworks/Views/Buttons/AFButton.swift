//
//  AFButton.swift
//  Apple-Frameworks
//
//  Created by SUCHAN CHANG on 2023/10/04.
//

import SwiftUI

struct AFButton: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.red)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: "Test Title")
    }
}

// iOS  17 이상
//#Preview {
//    AFButton(title: "Test Title")
//}
