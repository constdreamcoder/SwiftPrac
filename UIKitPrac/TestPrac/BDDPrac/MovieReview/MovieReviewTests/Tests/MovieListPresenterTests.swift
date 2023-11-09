//
//  MovieListPresenterTests.swift
//  MovieReviewTests
//
//  Created by SUCHAN CHANG on 2023/11/09.
//

import XCTest
@testable import MovieReview

// MARK: - BDD를 활용한 테스트 코드 작성 예시
final class MoviewListPresenterTests: XCTestCase {
    var sut: MoviewListPresenter!
    
    var viewController: MockMovieListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    var movieSearchManager: MockMovieSearchManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockMovieListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        movieSearchManager = MockMovieSearchManager()
        
        sut = MoviewListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager,
            movieSearchManager: movieSearchManager
        )
    }
    
    override func tearDown() {
        sut = nil
        
        viewController = nil
        userDefaultsManager = nil
        movieSearchManager = nil
        
        super.tearDown()
    }
    
    // request 메소드가 성공하면 updateSearchTableView가 실행되고
    func test_searchBar_textDidChange가_호출될때_request가_성공하면() {
        movieSearchManager.needToSuccessRequest = true
        sut.searchBar(UISearchBar(), textDidChange: "")
        
        XCTAssertTrue(viewController.isCalledUpdateSearchTableView, "updateSearchTableView가 실행된다.")
    }
    
    // reqeust 메소드가 실패하면 updateSearchtavleView가 실행되지 않음
    func test_searchBar_textDdidChange가_호출될때_request가_실패하면() {
        movieSearchManager.needToSuccessRequest = false
        sut.searchBar(UISearchBar(), textDidChange: "")
        
        XCTAssertFalse(viewController.isCalledUpdateSearchTableView, "updateSearchTableView가 실행되지 않는다.")
    }
}

// MARK: - 기능 미구현으로 테스트용으로 구현한 클래스들
final class UserDefaultsManager: UserDefaultsManagerProtocol {
    func getMovies() -> [Movie] {
        return []
    }
    
    func addMovie(_ newValue: Movie) {
        return
    }
    
    func removeMovie(_ value: Movie) {
        return
    }
}

final class MoviewListPresenter: NSObject {
    private weak var viewController: MovieListProtocol?
    
    private let userDefaultsManager: UserDefaultsManagerProtocol
    private let movieSearchManager: MovieSearchManagerProtocol
    
    private var currentMovieSearchResult: [Movie] = []
    
    init(
        viewController: MovieListProtocol,
        userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager(),
        movieSearchManager: MovieSearchManagerProtocol = MovieSearchManager()
    ) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
        self.movieSearchManager = movieSearchManager
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        movieSearchManager.request(form: searchText) { [weak self] movies in
            self?.currentMovieSearchResult = movies
            self?.viewController?.updateSearchTableView(isHidden: false)
        }
    }
}

