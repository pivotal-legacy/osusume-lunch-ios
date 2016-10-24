import XCTest

@testable import OsusumeLunch

class RestaurantCardViewTests: XCTestCase {
    var restaurantCardView: RestaurantCardView!
    
    override func setUp() {
        super.setUp()
        
        self.restaurantCardView = RestaurantCardView()
    }
    
    func test_restaurantCardViewHasRecommendationLabel() {
        let label = self.restaurantCardView.recommendationLabel

        XCTAssert(self.restaurantCardView.subviews.contains(label))
    }

    func test_recommendationLabelHasConstraints() {
        let superViewConstraintCount = ConstraintChecker.superviewConstraintCount(subview: self.restaurantCardView.recommendationLabel)
        let recommendationLabelConstraintCount = self.restaurantCardView.recommendationLabel.constraints.count
        let totalConstraintCount = superViewConstraintCount + recommendationLabelConstraintCount

        XCTAssertTrue(totalConstraintCount > 0)
    }

    func test_setRecommendationText_restaurantCardDoesSetRecommendationText() {
        let restaurantName = "Pizzakaya"
        self.restaurantCardView.setRecommendationText(recommendation: restaurantName)

        XCTAssertTrue(self.restaurantCardView.recommendationLabel.text == restaurantName)
    }
}
