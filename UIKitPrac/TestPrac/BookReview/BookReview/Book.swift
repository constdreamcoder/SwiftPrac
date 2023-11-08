//
//  Book.swift
//  BookReview
//
//  Created by SUCHAN CHANG on 2023/11/07.
//

import Foundation

struct Book: Decodable {
    let title: String
    private let image: String?
    
    var imageURL: URL? { URL(string: image ?? "") }
    
    init(title: String, image: String?) {
        self.title = title
        self.image = image
    }
}
