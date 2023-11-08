//
//  BookSearchResponseModel.swift
//  BookReview
//
//  Created by SUCHAN CHANG on 2023/11/07.
//

import Foundation

struct BookSearchResponseModel: Decodable {
    var items: [Book] = []
}
