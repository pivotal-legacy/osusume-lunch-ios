import XCTest

@testable import OsusumeLunch

class RestaurantCardViewTests: XCTestCase {
    var restaurantCardView: RestaurantCardView!
    
    override func setUp() {
        super.setUp()
        
        self.restaurantCardView = RestaurantCardView()
    }
    
    func test_restaurantCardViewHasLabels() {
        let titleLabel = self.restaurantCardView.titleLabel
        let recommendationLabel = self.restaurantCardView.recommendationLabel

        XCTAssertTrue(self.restaurantCardView.subviews.contains(titleLabel))
        XCTAssertTrue(self.restaurantCardView.subviews.contains(recommendationLabel))
    }

    func test_labelsHasConstraints() {
        XCTAssertTrue(ConstraintChecker.constraintCount(subview: self.restaurantCardView.recommendationLabel) > 0)
        XCTAssertTrue(ConstraintChecker.constraintCount(subview: self.restaurantCardView.titleLabel) > 0)
    }

    func test_setRecommendationText_restaurantCardDoesSetRecommendationText() {
        let restaurantName = "Pizzakaya"
        self.restaurantCardView.setRecommendationText(recommendation: restaurantName)

        XCTAssertEqual(self.restaurantCardView.titleLabel.text, self.restaurantCardView.titleString)
        XCTAssertTrue(self.restaurantCardView.recommendationLabel.text == restaurantName)
    }
}
