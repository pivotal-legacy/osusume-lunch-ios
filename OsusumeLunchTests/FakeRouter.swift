import Foundation
import UIKit

@testable import OsusumeLunch

class FakeRouter: Router {

    var dismissModalWasCalled = false
    func dismissModal(navigationController: UINavigationController) {
        dismissModalWasCalled = true
    }
}
