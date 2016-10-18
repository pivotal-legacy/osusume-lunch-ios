import Foundation
import UIKit

class NavigationRouter: Router {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func setScreen(viewController: UIViewController, animated: Bool) {
        navigationController.setViewControllers([viewController], animated: animated)
    }

    func showScreenAsModal(viewController: UIViewController, animated: Bool) {
        let newNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(newNavigationController, animated: animated, completion: nil)
    }

    func dismissModal(navigationController: UINavigationController, animated: Bool) {
        navigationController.dismiss(animated: animated, completion: nil)
    }
}
