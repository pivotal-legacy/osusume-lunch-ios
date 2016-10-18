import Foundation
import UIKit

class NavigationRouter: Router {
    func dismissModal(navigationController: UINavigationController) {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
