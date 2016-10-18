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
        self.setupViewComponents()
        self.addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - View Lifecycle
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let margins = self.view.layoutMarginsGuide

        self.recommendationLabel.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.25).isActive = true
        self.recommendationLabel.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        self.recommendationLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.recommendationLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        self.recommendationButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
        self.recommendationButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.recommendationButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.recommendationButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
    }

    // MARK: - Setup Subviews
    private func setupNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(self.showRestaurants))
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "show restaurants button"
    }

    private func setupViewComponents() {
        self.recommendationLabel.textAlignment = .center
        self.recommendationLabel.textColor = UIColor.purple

        let image = UIImage(named: "clickMeImage.png")
        self.recommendationButton.setImage(image, for: .normal)
        self.recommendationButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit

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
        self.recommendationRepository.findRecommendation()
            .onSuccess { restaurant in
                self.recommendationLabel.text = restaurant.name
            }
            .onFailure { error in
                self.recommendationLabel.text = "Not Found"
            }
    }

    func showRestaurants() {
        let viewController = UINavigationController(rootViewController: RestaurantTableViewController())
        self.navigationController?.present(viewController, animated: true, completion: nil)
    }
}
