import XCTest

@testable import OsusumeLunch

class NewRestaurantViewControllerTests: XCTestCase {
    let viewController = NewRestaurantViewController()
    var fakeRestaurantRepository: FakeRestaurantRepository!
    

    override func setUp() {
        super.setUp()

        self.fakeRestaurantRepository = FakeRestaurantRepository()
        self.viewController.restaurantRepository = self.fakeRestaurantRepository
        self.viewController.view.setNeedsLayout()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_pageRendersTitle() {
        let navigationTite = self.viewController.navigationItem.title!

        XCTAssertEqual(navigationTite, "Add Spot")
    }

    func test_hasViewComponents() {
        let textField = self.viewController.nameTextField

        XCTAssertTrue(self.viewController.view.subviews.contains(textField))
    }

    func test_componentsHasCorrectTitle() {
        let textField = self.viewController.nameTextField

        XCTAssertEqual(textField.placeholder, "Name")
    }

    func test_textFieldIsFirstResponder() {
        let window = UIWindow()
        window.addSubview(self.viewController.view)

        let textField = self.viewController.nameTextField

        XCTAssertTrue(textField.isFirstResponder)
    }

    func test_textFieldKeyboardHasDoneLabel() {
        let textField = self.viewController.nameTextField

        XCTAssertEqual(textField.returnKeyType, UIReturnKeyType.done)
    }

    func test_componentsHaveConstraints() {
        let textFieldConstraintCount = ConstraintChecker.constraintCount(subview: self.viewController.nameTextField)

        XCTAssertTrue(textFieldConstraintCount > 0)
    }
}
