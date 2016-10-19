import XCTest

@testable import OsusumeLunch

class NavigationRouterTests: XCTestCase {
    var navigationRouter: NavigationRouter!
    var rootNavigationController: UINavigationController!

    override func setUp() {
        super.setUp()

        self.rootNavigationController = UINavigationController()
        self.navigationRouter = NavigationRouter(
            navigationController: rootNavigationController
        )
    }
    
    func test_setScreen_showsScreen() {
        let screen = UIViewController()
        navigationRouter.setScreen(viewController: screen, animated: false)

        XCTAssertTrue(self.rootNavigationController.topViewController === screen)
    }

    func test_pushScreen_pushesScreenOnModal() {
        configureUIWindowWithRootViewController()

        let navController = UINavigationController(rootViewController: UIViewController())
        self.rootNavigationController.present(navController, animated: false, completion: nil)

        let screen = UIViewController()
        navigationRouter.pushScreen(viewController: screen, animated: false)

        XCTAssertTrue(navController.topViewController === screen)
    }

    func test_pushScreen_pushesScreen() {
        let screen = UIViewController()
        navigationRouter.pushScreen(viewController: screen, animated: false)

        XCTAssertTrue(rootNavigationController.topViewController === screen)
    }

    func test_popScreen_popsScreen() {
        let screen1 = UIViewController()
        let screen2 = UIViewController()
        rootNavigationController.setViewControllers(
            [screen1, screen2],
            animated: false
        )

        navigationRouter.popScreen(animated: false)

        XCTAssertTrue(rootNavigationController.topViewController === screen1)
    }

    func test_showScreenAsModal_showsScreenAsModal() {
        configureUIWindowWithRootViewController()

        let screen = UIViewController()
        navigationRouter.showScreenAsModal(viewController: screen, animated: false)

        let navController = rootNavigationController.presentedViewController as? UINavigationController

        XCTAssertTrue(navController?.topViewController === screen)
    }

    func test_dismissModal_dismissCurrentNavigationController() {
        configureUIWindowWithRootViewController()

        let modalNavController = UINavigationController(rootViewController: UIViewController())
        rootNavigationController.present(
            modalNavController,
            animated: false,
            completion: nil
        )

        let presentedNavController = rootNavigationController.presentedViewController as? UINavigationController
        XCTAssertNotNil(presentedNavController?.topViewController)

        navigationRouter.dismissModal(navigationController: modalNavController, animated: false)

        RunLoop.osu_advance(by: 1)
        XCTAssertNil(self.rootNavigationController.presentedViewController)
    }

    private func configureUIWindowWithRootViewController() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window: UIWindow = appDelegate.window!
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
}

extension RunLoop {
    static func osu_advance(by timeInterval: TimeInterval = 0.01) {
        let stopDate = NSDate().addingTimeInterval(timeInterval)
        main.run(until: stopDate as Date)
    }
}
