import XCTest

@testable import OsusumeLunch

class RecommendationViewControllerTests: XCTestCase {
    var recommendationViewController: RecommendationViewController!

    override func setUp() {
        super.setUp()

        self.recommendationViewController = RecommendationViewController()
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
}
