import XCTest

@testable import OsusumeLunch

class RestaurantTableViewControllerTests: XCTestCase {
    var restaurantTableViewController = RestaurantTableViewController()

    override func setUp() {
        super.setUp()
        restaurantTableViewController.restaurantRepository = FakeRestaurantRepository()
        restaurantTableViewController.view.setNeedsLayout()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_viewDidLoad_getRestaurantsList() {

    }
}
