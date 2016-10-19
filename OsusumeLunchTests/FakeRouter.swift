import Foundation
import UIKit

@testable import OsusumeLunch

class FakeRouter: Router {
    var setScreenWasCalled = false
    var setScreenArg: UIViewController = UIViewController()
    func setScreen(viewController: UIViewController, animated: Bool) {
        setScreenWasCalled = true
        setScreenArg = viewController
    }

    var pushScreenWasCalled = false
    var pushScreenArg: UIViewController = UIViewController()
    func pushScreen(viewController: UIViewController, animated: Bool) {
        pushScreenWasCalled = true
        pushScreenArg = viewController
    }

    var popScreenWasCalled = false
    func popScreen(animated: Bool) {
        popScreenWasCalled = true
    }

    var showScreenAsModalWasCalled = false
    var showScreenAsModalArg: UIViewController = UIViewController()
    func showScreenAsModal(viewController: UIViewController, animated: Bool) {
        showScreenAsModalWasCalled = true
        showScreenAsModalArg = viewController
    }
    
    var dismissModalWasCalled = false
    var dismissModalArg: UINavigationController = UINavigationController()
    func dismissModal(navigationController: UINavigationController, animated: Bool) {
        dismissModalWasCalled = true
        dismissModalArg = navigationController
    }
}
