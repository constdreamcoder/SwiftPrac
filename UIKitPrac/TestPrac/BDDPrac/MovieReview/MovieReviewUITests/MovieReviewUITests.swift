//
//  MovieReviewUITests.swift
//  MovieReviewUITests
//
//  Created by SUCHAN CHANG on 2023/11/08.
//

import XCTest

final class MovieReviewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // 하나라도 실패하는 항목이 생기면 앱을 종료
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        
        app = nil
    }
    
    func test_navigationBar의_title이_영화평점으로_설정되어있다() {
        let existNavigationBar = app.navigationBars["영화 평점"].exists
        XCTAssertTrue(existNavigationBar)
    }
    
    func test_searchBar가_존재한다() {
        let existSearchBar = app.navigationBars["영화 평점"]
            .searchFields["Search"]
            .exists
        
        XCTAssertTrue(existSearchBar)
    }
    
    func test_searchBar에_cancel버튼이_존재한다() {
        let navigationBar = app.navigationBars["영화 평점"]
        navigationBar
            .searchFields["Search"]
            .tap()
        
        let existSearchBarCancelButton = navigationBar
            .buttons["Cancel"]
            .exists
        
        XCTAssertTrue(existSearchBarCancelButton)
    }
}
