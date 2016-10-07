import XCTest
import OsusumeNetworking

@testable import OsusumeLunch

class RestaurantWhitelistTableViewCellTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    func test_cellHasCustomViewComponents() {
        let cell = RestaurantWhitelistTableViewCell()

        XCTAssertTrue(cell.contentView.subviews.contains(cell.restaurantNameLabel))
        XCTAssertTrue(cell.contentView.subviews.contains(cell.whitelistSwitch))
        XCTAssertTrue(cell.whitelistSwitch.isOn)
    }

    func test_cellSetsRestaurantName() {
        let restaurant = Restaurant(name: "Pizzakaya")

        let cell = RestaurantWhitelistTableViewCell()
        cell.setRestaurant(restaurant: restaurant)

        XCTAssertEqual(cell.restaurantNameLabel.text, "Pizzakaya")
    }
}
