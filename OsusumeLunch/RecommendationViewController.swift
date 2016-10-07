import Foundation
import UIKit
import OsusumeNetworking

class RecommendationViewController: UIViewController {

    // MARK: - Properties
    var recommendationButton = AutoLayoutButton()
    var recommendationLabel = AutoLayoutLabel()
    var recommendationRepository: RecommendationRepository = NetworkRecommendationRepository()

    init() {
        super.init(nibName: nil, bundle: nil)

        self.setupNavigationItems()
        self.setupButton()
        self.addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - View Lifecycle
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let margins = self.view.layoutMarginsGuide

        self.recommendationButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
        self.recommendationButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.recommendationButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.recommendationButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true

        self.recommendationLabel.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.25).isActive = true
        self.recommendationLabel.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        self.recommendationLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.recommendationLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }

    // MARK: - Setup Subviews
    private func setupNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(self.showRestaurants))
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "show restaurants button"
    }

    private func setupButton() {
        self.recommendationButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.recommendationButton.setTitle("recommend", for: UIControlState.normal)
        self.recommendationButton.layer.borderColor = UIColor.black.cgColor
        self.recommendationButton.layer.borderWidth = 1.0

        self.recommendationButton.addTarget(
            self,
            action: #selector(self.getRecommendation),
            for: UIControlEvents.touchUpInside
        )
    }

    private func addSubviews() {
        self.view.addSubview(self.recommendationButton)
        self.view.addSubview(self.recommendationLabel)
    }

    // MARK: - Actions
    func getRecommendation() {
        self.recommendationRepository.getRecommendation()
            .onSuccess { restaurant in
                self.recommendationLabel.text = restaurant.name
            }
            .onFailure { error in
                self.recommendationLabel.text = "Not Found"
            }
    }

    func showRestaurants() {
        self.navigationController?.pushViewController(RestaurantTableViewController(), animated: true)
    }
}
