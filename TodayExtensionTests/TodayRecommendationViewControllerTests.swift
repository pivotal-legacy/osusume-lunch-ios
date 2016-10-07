import XCTest
import BrightFutures
import Result
import OsusumeNetworking

// @testable import OsusumeLunchToday // not supported by Apple as it is an extension
// This test was included as a target by OsusumeLunchToday

class TodayRecommendationViewControllerTests: XCTestCase {
    var todayRecommendationViewController: TodayRecommendationViewController!

    override func setUp() {
        super.setUp()

        self.todayRecommendationViewController = TodayRecommendationViewController()
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

    func test_getRecommendationUpdatesLabelOnSuccess() {

        let fakeRecommendationRepository = FakeRecommendationRepository()

        self.todayRecommendationViewController.recommendationRepository = fakeRecommendationRepository

        let expectedRestaurantName = "Butagumi"

        let promise = Promise<Restaurant, NSError>()
        promise.success(Restaurant(id: 1, name: expectedRestaurantName))
        fakeRecommendationRepository.getRecommendationReturnValue = promise

        self.todayRecommendationViewController.getRecommendation()

        let waitExpectation = self.expectation(description: "wait for async call")

        promise.future.onComplete(callback: { result in
            waitExpectation.fulfill()

            XCTAssertTrue(fakeRecommendationRepository.getRecommendationWasCalled)
            XCTAssertEqual(self.todayRecommendationViewController.label.text, expectedRestaurantName)
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }

}
