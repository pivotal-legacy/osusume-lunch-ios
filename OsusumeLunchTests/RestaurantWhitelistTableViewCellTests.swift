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
        let restaurant = Restaurant(id: 1, name: "Pizzakaya")

        let cell = RestaurantWhitelistTableViewCell()
        cell.setRestaurant(restaurant: restaurant)

        XCTAssertEqual(cell.restaurantNameLabel.text, "Pizzakaya")
        XCTAssertEqual(cell.restaurantId, 1)
    }

    func test_cellSetsIdToUserDefaultsIfSwitchIsOff() {
        let restaurant = Restaurant(id: 1, name: "Pizzakaya")

        let cell = RestaurantWhitelistTableViewCell()
        cell.setRestaurant(restaurant: restaurant)

        cell.userDefaults = FakeUserDefaults()

        cell.whitelistSwitch.setOn(false, animated: false)
        cell.addBlackList(switchState: cell.whitelistSwitch)

        let blackListIds = cell.userDefaults.getBlacklistIds()

        XCTAssertEqual(blackListIds, [1])
    }

    func test_cellRemoveIdFromUserDefaultsIfSwitchIsOn() {
        let restaurant = Restaurant(id: 1, name: "Pizzakaya")

        let cell = RestaurantWhitelistTableViewCell()
        cell.setRestaurant(restaurant: restaurant)

        cell.userDefaults = FakeUserDefaults()
        cell.userDefaults.setBlacklistId(id: 1)

        cell.whitelistSwitch.setOn(true, animated: false)
        cell.addBlackList(switchState: cell.whitelistSwitch)

        let blackListIds = cell.userDefaults.getBlacklistIds()

        XCTAssertEqual(blackListIds, [])
    }
}
