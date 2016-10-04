import XCTest

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

    func test_recommendationButtonHasConstraints() {
        self.recommendationViewController.viewWillLayoutSubviews()

        let superviewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.recommendationViewController.recommendationButton)
        let buttonConstraintCount = self.recommendationViewController.recommendationButton.constraints.count
        let totalConstraintCount = buttonConstraintCount + superviewConstraintCount

        XCTAssertTrue(totalConstraintCount == 4)
    }

    func test_tappingRecommendationButtonCallsGetRecommendation() {
        self.recommendationViewController.recommendationButton.sendActions(for: UIControlEvents.touchUpInside)

        XCTAssertTrue(self.fakeRestaurantRepository.getRecommendationWasCalled)
    }
}
