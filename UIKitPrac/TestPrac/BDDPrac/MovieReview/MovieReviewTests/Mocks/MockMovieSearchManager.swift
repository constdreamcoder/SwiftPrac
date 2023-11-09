//
//  MockMovieSearchManager.swift
//  MovieReviewTests
//
//  Created by SUCHAN CHANG on 2023/11/09.
//

import Foundation
@testable import MovieReview

final class MockMovieSearchManager: MovieSearchManagerProtocol {
    var isCalledRequest = false
    
    var needToSuccessRequest = false
    
    func request(
        form keyword: String,
        completionHandler: @escaping ([Movie]) -> Void
    ) {
        isCalledRequest = true
        
        if needToSuccessRequest {
            completionHandler([])
        }
    }
}
