//
//  ReviewListPresenterTests.swift
//  ReviewListPresenterTests
//
//  Created by SUCHAN CHANG on 2023/11/07.
//

import XCTest
@testable import BookReview

final class ReviewListPresenterTests: XCTestCase {
    // ! 사용권장 - 작동이 의도대로 제대로 동작하지 않는 부분은 개발자가 빨리 알아차리는게 더 나아서
    var sut: ReviewListPresenter! // 테스트 대상 변수명은 보통 'sut'이라고 명명함
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewListPresenter(
            viewController: viewController,
            userDefaultsManager: userDefaultsManager
        )
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        
        super.tearDown()
    }
    
    func test_viewDidLoad가_호출될_때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetupNavigationBar)
        XCTAssertTrue(viewController.isCalledSetupViews)
    }
    
    func test_viewWillAppear가_호출될_때() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetReviews)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
    
    func test_didTapRightBarButtonItem이_호출될_때() {
        sut.didTapRightBarButtonItem()
        
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }
}

