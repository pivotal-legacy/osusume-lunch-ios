import XCTest
import BrightFutures
import OsusumeNetworking

@testable import OsusumeLunch

class RecommendationViewControllerTests: XCTestCase {
    var recommendationViewController: RecommendationViewController!
    var fakeRestaurantRepository: FakeRestaurantRepository!

    override func setUp() {
        super.setUp()

        self.fakeRestaurantRepository = FakeRestaurantRepository()

        self.recommendationViewController = RecommendationViewController()
        self.recommendationViewController.restaurantRepository = self.fakeRestaurantRepository
    }

    func test_recommendationButtonHasCorrectLabel() {
        XCTAssertEqual(self.recommendationViewController.recommendationButton.titleLabel!.text, "recommend")
    }

    func test_recommendationButtonIsAddedToSubview() {
        let button = self.recommendationViewController.recommendationButton
        XCTAssertTrue(self.recommendationViewController.view.subviews.contains(button))
    }

    func test_recommendationLabelIsAddedToSubview() {
        let label = self.recommendationViewController.recommendationLabel
        XCTAssertTrue(self.recommendationViewController.view.subviews.contains(label))
    }

    func test_recommendationButtonHasConstraints() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let superviewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.recommendationViewController.recommendationButton)
        let buttonConstraintCount = self.recommendationViewController.recommendationButton.constraints.count
        let totalConstraintCount = buttonConstraintCount + superviewConstraintCount

        XCTAssertTrue(totalConstraintCount == 4)
    }

    func test_recommendationLabelHasConstraints() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let superviewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.recommendationViewController.recommendationLabel)
        let labelConstraintCount = self.recommendationViewController.recommendationLabel.constraints.count
        let totalConstraintCount = labelConstraintCount + superviewConstraintCount

        XCTAssertTrue(totalConstraintCount == 4)
    }


    func test_navigationBarHasListButton() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let rightBarButton = self.recommendationViewController.navigationItem.rightBarButtonItem

        XCTAssertEqual(rightBarButton?.accessibilityIdentifier, "show restaurants button")
    }

    func test_tappingRecommendationButtonDisplaysTextInLabelOnSuccess() {
        let expectedRestaurantName = "Butagumi"
        
        let promise = Promise<Restaurant, NSError>()
        promise.success(Restaurant(name: expectedRestaurantName))
        self.fakeRestaurantRepository.getRecommendationReturnValue = promise

        self.recommendationViewController.recommendationButton.sendActions(for: UIControlEvents.touchUpInside)

        let waitExpectation = self.expectation(description: "wait for async call")

        promise.future.onComplete(callback: { result in
            waitExpectation.fulfill()

            XCTAssertTrue(self.fakeRestaurantRepository.getRecommendationWasCalled)
            XCTAssertEqual(self.recommendationViewController.recommendationLabel.text, expectedRestaurantName)
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }

    func test_tappingRecommendationButtonDisplaysNotFoundOnFailure() {
        let promise = Promise<Restaurant, NSError>()
        promise.failure(NSError(domain: "", code: 0, userInfo: nil))
        self.fakeRestaurantRepository.getRecommendationReturnValue = promise

        let waitExpectation = self.expectation(description: "wait for async call")

        self.recommendationViewController.recommendationButton.sendActions(for: UIControlEvents.touchUpInside)

        promise.future.onComplete(callback: { result in
            waitExpectation.fulfill()

            XCTAssertTrue(self.fakeRestaurantRepository.getRecommendationWasCalled)
            XCTAssertEqual(self.recommendationViewController.recommendationLabel.text, "Not Found")
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }
}
