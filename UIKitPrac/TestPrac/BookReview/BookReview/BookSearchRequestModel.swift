//
//  BookSearchRequestModel.swift
//  BookReview
//
//  Created by SUCHAN CHANG on 2023/11/07.
//

import Foundation

struct BookSearchRequestModel: Codable {
    /// 검색할 책 키워드
    let query: String
}
