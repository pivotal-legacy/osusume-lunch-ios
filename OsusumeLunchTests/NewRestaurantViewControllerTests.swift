import XCTest

@testable import OsusumeLunch

class NewRestaurantViewControllerTests: XCTestCase {
    let viewController = NewRestaurantViewController()

    override func setUp() {
        super.setUp()
        self.viewController.view.setNeedsLayout()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_pageRendersTitle() {
        let navigationTite = self.viewController.navigationItem.title!

        XCTAssertEqual(navigationTite, "New Restaurant")
    }
}
