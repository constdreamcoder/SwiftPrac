//
//  MockUserDefaultsManager.swift
//  MovieReviewTests
//
//  Created by SUCHAN CHANG on 2023/11/09.
//

import Foundation
@testable import MovieReview

protocol UserDefaultsManagerProtocol: AnyObject {
    func getMovies() -> [Movie]
    func addMovie(_ newValue: Movie)
    func removeMovie(_ value: Movie)
}

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetMovies = false
    var isCalledAddMovie = false
    var isCalledRemoveMovie = false
    
    func getMovies() -> [Movie] {
        isCalledGetMovies = true
        return []
    }
    
    func addMovie(_ newValue: Movie) {
        isCalledAddMovie = true
    }
    
    func removeMovie(_ value: Movie) {
        isCalledRemoveMovie = true
    }
}
