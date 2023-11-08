//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by SUCHAN CHANG on 2023/10/04.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks, id: \.id) { framework in
                    NavigationLink {
                        FrameworkDetailView(
                            viewModel: FrameworkDetailViewModel(
                                framework: self.releaseOptional(),
                                isShowingDetailView: $viewModel.isShowingDetailView
                            )
                        )
                        
                    } label: {
                        FrameworkTitleView(framework: framework)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("🍎 Frameworks")
        }
        .tint(Color(.label))
    }
    
    func releaseOptional() -> Framework {
        if let framework = viewModel.selectedFramework {
            return framework
        }
        return MockData.sampleFramework
    }
}

struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
    }
}

// iOS 17 이상
//#Preview {
//    FrameworkGridView()
//}
