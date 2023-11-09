//
//  MockMovieListViewController.swift
//  MovieReviewTests
//
//  Created by SUCHAN CHANG on 2023/11/09.
//

import Foundation
@testable import MovieReview

protocol MovieListProtocol: AnyObject {
    func setupNavigationBar()
    func setupSearchBar()
    func setupViews()
    func updateSearchTableView(isHidden: Bool)
    func pushToMovieViewController(with movie: Movie)
    func updateCollectionView()
}

final class MockMovieListViewController: MovieListProtocol {
    var isCalledSetupNavigationBar = false
    var isCalledSetupSearchBar = false
    var isCalledSetupViews = false
    var isCalledUpdateSearchTableView = false
    var isCalledPushToMovieViewController = false
    var isCalledUpdateCollectionView = false
    
    func setupNavigationBar() {
        isCalledSetupNavigationBar = true
    }
    
    func setupSearchBar() {
        isCalledSetupSearchBar = true
    }
    
    func setupViews() {
        isCalledSetupViews = true
    }
    
    func updateSearchTableView(isHidden: Bool) {
        isCalledUpdateSearchTableView = true
    }
    
    func pushToMovieViewController(with movie: Movie) {
        isCalledPushToMovieViewController = true
    }
    
    func updateCollectionView() {
        isCalledUpdateCollectionView = true
    }
}
