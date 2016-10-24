import XCTest
import BrightFutures
import OsusumeNetworking

@testable import OsusumeLunch

class RecommendationViewControllerTests: XCTestCase {
    var recommendationViewController: RecommendationViewController!
    var fakeRecommendationRepository: FakeRecommendationRepository!
    var fakeRouter: FakeRouter!

    override func setUp() {
        super.setUp()

        self.fakeRecommendationRepository = FakeRecommendationRepository()
        self.fakeRouter = FakeRouter()

        self.recommendationViewController = RecommendationViewController(router: self.fakeRouter)
        self.recommendationViewController.recommendationRepository = self.fakeRecommendationRepository
    }

    // MARK: - Setup Subviews Tests
    func test_recommendationButtonIsAddedToSubview() {
        let button = self.recommendationViewController.recommendationButton
        
        XCTAssertTrue(self.recommendationViewController.view.subviews.contains(button))
    }

    func test_recommendationLabelIsAddedToSubview() {
        let label = self.recommendationViewController.restaurantCardView

        XCTAssertTrue(self.recommendationViewController.view.subviews.contains(label))
    }

    func test_recommendationButtonHasConstraints() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let superviewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.recommendationViewController.recommendationButton)
        let buttonConstraintCount = self.recommendationViewController.recommendationButton.constraints.count
        let totalConstraintCount = buttonConstraintCount + superviewConstraintCount

        XCTAssertTrue(totalConstraintCount == 4)
    }

    func test_restaurantCardHasConstraints() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let superviewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.recommendationViewController.restaurantCardView)
        let cardConstraintCount = self.recommendationViewController.restaurantCardView.constraints.count
        let totalConstraintCount = cardConstraintCount + superviewConstraintCount

        XCTAssertTrue(totalConstraintCount > 0)
    }

    func test_navigationBarHasListButton() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let rightBarButton = self.recommendationViewController.navigationItem.rightBarButtonItem

        XCTAssertEqual(rightBarButton?.accessibilityIdentifier, "show restaurants button")
    }

    // MARK: - Action Tests
    func test_tappingRecommendationButtonDisplaysTextInLabelOnSuccess() {
        let expectedRestaurantName = "Butagumi"
        
        let promise = Promise<Restaurant, NSError>()
        promise.success(Restaurant(id: 1, name: expectedRestaurantName))
        self.fakeRecommendationRepository.findRecommendationReturnValue = promise

        self.recommendationViewController.recommendationButton.sendActions(for: UIControlEvents.touchUpInside)

        let waitExpectation = self.expectation(description: "wait for async call")

        promise.future.onComplete(callback: { result in
            waitExpectation.fulfill()

            XCTAssertTrue(self.fakeRecommendationRepository.findRecommendationWasCalled)
            XCTAssertEqual(self.recommendationViewController.restaurantCardView.recommendationLabel.text, expectedRestaurantName)
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }

    func test_tappingRecommendationButtonDisplaysNotFoundOnFailure() {
        let promise = Promise<Restaurant, NSError>()
        promise.failure(NSError(domain: "", code: 0, userInfo: nil))
        self.fakeRecommendationRepository.findRecommendationReturnValue = promise

        let waitExpectation = self.expectation(description: "wait for async call")

        self.recommendationViewController.recommendationButton.sendActions(for: UIControlEvents.touchUpInside)

        promise.future.onComplete(callback: { result in
            waitExpectation.fulfill()

            XCTAssertTrue(self.fakeRecommendationRepository.findRecommendationWasCalled)
            XCTAssertEqual(self.recommendationViewController.restaurantCardView.recommendationLabel.text, "Not Found")
        })

        self.waitForExpectations(timeout: 1, handler: nil)
    }

    func test_tappingShowRestaurantsButtonShowsRestaurantsScreen() {

        let rightBarButton = self.recommendationViewController.navigationItem.rightBarButtonItem

        self.recommendationViewController.perform(rightBarButton?.action)

        XCTAssertTrue(self.fakeRouter.showScreenAsModalWasCalled)
        XCTAssertTrue(self.fakeRouter.showScreenAsModalArg is RestaurantTableViewController)
    }
}
