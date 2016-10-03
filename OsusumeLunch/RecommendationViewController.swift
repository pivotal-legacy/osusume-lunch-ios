import Foundation
import UIKit

class RecommendationViewController: UIViewController {

    var recommendationButton = AutoLayoutButton()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        self.setupButton()
        self.setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        self.recommendationButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.recommendationButton.setTitle("recommend", for: UIControlState.normal)
        self.recommendationButton.layer.borderColor = UIColor.black.cgColor
        self.recommendationButton.layer.borderWidth = 1.0
    }

    private func setupSubviews() {
        self.view.addSubview(self.recommendationButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let margins = self.view.layoutMarginsGuide

        self.recommendationButton.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.recommendationButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.recommendationButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.recommendationButton.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
