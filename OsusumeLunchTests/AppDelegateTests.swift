import XCTest

@testable import OsusumeLunch

class AppDelegateTests: XCTestCase {

    var appDelegate: AppDelegate!

    override func setUp() {
        super.setUp()

        self.appDelegate = AppDelegate()
        let window = UIWindow()

        self.appDelegate.window = window
        self.appDelegate.setInitialViewController(window: window)
    }
    
    func test_navigationControllerIsRootViewController() {
        XCTAssertTrue(self.appDelegate.window!.rootViewController is UINavigationController)
    }

    func test_RecommendationViewControllerIsNavigationControllerRoot() {
        let navigationController = self.appDelegate.window!.rootViewController as! UINavigationController

        XCTAssertTrue(navigationController.viewControllers[0] is RecommendationViewController)
    }
}
