//
//  Movie.swift
//  MovieReview
//
//  Created by SUCHAN CHANG on 2023/11/08.
//

import Foundation

struct Movie: Decodable {
    let title: String
    private let image: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: String

    var imageURL: URL? { URL(string: image) }
}
