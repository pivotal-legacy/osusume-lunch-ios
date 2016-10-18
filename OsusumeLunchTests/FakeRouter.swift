import Foundation
import UIKit

@testable import OsusumeLunch

class FakeRouter: Router {
    var setScreenWasCalled = false
    func setScreen(viewController: UIViewController, animated: Bool) {
        setScreenWasCalled = true
    }

    var showScreenAsModalWasCalled = false
    func showScreenAsModal(viewController: UIViewController, animated: Bool) {
        showScreenAsModalWasCalled = true
    }
    
    var dismissModalWasCalled = false
    func dismissModal(navigationController: UINavigationController, animated: Bool) {
        dismissModalWasCalled = true
    }
}
