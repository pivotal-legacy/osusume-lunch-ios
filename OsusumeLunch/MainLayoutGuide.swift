import UIKit

class MainLayoutGuide: UILayoutGuide {
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
        super.init()

        self.setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        self.viewController.view.addLayoutGuide(self)
        self.topAnchor.constraint(
            equalTo: self.viewController.topLayoutGuide.bottomAnchor).isActive = true
        self.leftAnchor.constraint(
            equalTo: self.viewController.view.layoutMarginsGuide.leftAnchor).isActive = true
        self.rightAnchor.constraint(
            equalTo: self.viewController.view.layoutMarginsGuide.rightAnchor).isActive = true
        self.bottomAnchor.constraint(
            equalTo: self.viewController.view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
