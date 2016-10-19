import Foundation
import UIKit

protocol Router {
    func setScreen(viewController: UIViewController, animated: Bool)
    func pushScreen(viewController: UIViewController, animated: Bool)
    func popScreen(animated: Bool)
    func showScreenAsModal(viewController: UIViewController, animated: Bool)
    func dismissModal(navigationController: UINavigationController, animated: Bool)
}
