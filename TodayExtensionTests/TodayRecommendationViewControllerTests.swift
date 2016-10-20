import XCTest
import BrightFutures
import Result
import OsusumeNetworking


// @testable import TodayExtension // not supported by Apple as it is an extension
// This test was included as a target by TodayExtension

class TodayRecommendationViewControllerTests: XCTestCase {
    var todayRecommendationViewController: TodayRecommendationViewController!
    let fakeRecommendationRepository = FakeRecommendationRepository()


    override func setUp() {
        super.setUp()

        self.todayRecommendationViewController = TodayRecommendationViewController()
        self.todayRecommendationViewController.recommendationRepository = fakeRecommendationRepository
        self.todayRecommendationViewController.view.setNeedsLayout()
    }

    func test_labelIsAddedToSubview() {
        let label = self.todayRecommendationViewController.label

        XCTAssertTrue(self.todayRecommendationViewController.view.subviews.contains(label))
    }
    
    func test_labelHasConstraints() {
        let superviewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.todayRecommendationViewController.label)
        let labelConstraintCount = self.todayRecommendationViewController.label.constraints.count
        let totalConstraintCount = labelConstraintCount + superviewConstraintCount

        XCTAssertTrue(totalConstraintCount == 4)
    }

    func test_labelHasDefaultTitle() {
        let label = self.todayRecommendationViewController.label

        XCTAssertTrue((label.text?.characters.count)! > 0)
    }

    func test_viewHasTapGestureRecognizer() {
        let view = self.todayRecommendationViewController.view

        XCTAssertTrue((view?.gestureRecognizers?.count)! > 0)
    }

    func test_getRecommendationUpdatesLabelOnSuccess() {
        let expectedRestaurantName = "Butagumi"

        let promise = Promise<Restaurant, NSError>()
        promise.success(Restaurant(id: 1, name: expectedRestaurantName))
        fakeRecommendationRepository.findRecommendationReturnValue = promise

        self.todayRecommendationViewController.getRecommendation()

        let waitExpectation = self.expectation(description: "wait for async call")

        promise.future.onComplete(callback: { result in
            waitExpectation.fulfill()

            XCTAssertTrue(self.fakeRecommendationRepository.findRecommendationWasCalled)
            XCTAssertEqual(self.todayRecommendationViewController.label.text, expectedRestaurantName)
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }

    func test_didTapView_updatesLabelOnGetRecommendationSuccessful() {
        let expectedRestaurantName = "Afuri"

        let promise = Promise<Restaurant, NSError>()
        promise.success(Restaurant(id: 1, name: expectedRestaurantName))
        fakeRecommendationRepository.findRecommendationReturnValue = promise

        self.todayRecommendationViewController.didTapView()

        let waitExpectation = self.expectation(description: "wait for async call")
        promise.future.onComplete(callback: {_ in 
            waitExpectation.fulfill()

            XCTAssertTrue(self.fakeRecommendationRepository.findRecommendationWasCalled)
            XCTAssertEqual(self.todayRecommendationViewController.label.text, expectedRestaurantName)
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }
}
