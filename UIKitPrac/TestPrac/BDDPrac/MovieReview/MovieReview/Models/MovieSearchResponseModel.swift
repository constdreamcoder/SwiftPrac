//
//  MovieSearchResponseModel.swift
//  MovieReview
//
//  Created by SUCHAN CHANG on 2023/11/08.
//

import Foundation

struct MovieSearchResponseModel: Decodable {
    var item: [Movie] = []
}
