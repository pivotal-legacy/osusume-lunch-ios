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
