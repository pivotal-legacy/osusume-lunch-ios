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

    func test_hasViewComponents() {
        let label = self.viewController.nameTextFieldLabel
        let textField = self.viewController.nameTextField
        let button = self.viewController.saveButton

        XCTAssertTrue(self.viewController.view.subviews.contains(label))
        XCTAssertTrue(self.viewController.view.subviews.contains(textField))
        XCTAssertTrue(self.viewController.view.subviews.contains(button))
    }

    func test_componentsHasCorrectTitle() {
        let label = self.viewController.nameTextFieldLabel
        let button = self.viewController.saveButton

        XCTAssertEqual(label.text, "Name")
        XCTAssertEqual(button.titleLabel?.text, "Save")
    }

    func test_labelHasConstraints() {
        let labelConstraintCount = ConstraintChecker.constraintCount(subview: self.viewController.nameTextFieldLabel)
        let textFieldConstraintCount = ConstraintChecker.constraintCount(subview: self.viewController.nameTextField)
        let buttonConstraintCount = ConstraintChecker.constraintCount(subview: self.viewController.saveButton)

        XCTAssertTrue(labelConstraintCount > 0)
        XCTAssertTrue(textFieldConstraintCount > 0)
        XCTAssertTrue(buttonConstraintCount > 0 )
    }
}
