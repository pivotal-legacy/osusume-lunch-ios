import Foundation
import UIKit
import OsusumeNetworking

class RecommendationViewController: UIViewController {

    // MARK: - Properties
    var recommendationButton = AutoLayoutButton()
    var restaurantCardView = RestaurantCardView()
    var recommendationRepository: RecommendationRepository = NetworkRecommendationRepository()
    let router: Router

    init(router: Router) {
        self.router = router

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

        let mainLayoutGuide = MainLayoutGuide(viewController: self)

        self.restaurantCardView.topAnchor.constraint(
            equalTo: mainLayoutGuide.topAnchor).isActive = true
        self.restaurantCardView.leadingAnchor.constraint(
            equalTo: mainLayoutGuide.leadingAnchor).isActive = true
        self.restaurantCardView.trailingAnchor.constraint(
            equalTo: mainLayoutGuide.trailingAnchor).isActive = true
        self.restaurantCardView.heightAnchor.constraint(
            equalTo: mainLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true

        self.recommendationButton.backgroundColor = UIColor.orange
        self.recommendationButton.heightAnchor.constraint(
            equalTo: mainLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        self.recommendationButton.leadingAnchor.constraint(
            equalTo: mainLayoutGuide.leadingAnchor).isActive = true
        self.recommendationButton.trailingAnchor.constraint(
            equalTo: mainLayoutGuide.trailingAnchor).isActive = true
        self.recommendationButton.bottomAnchor.constraint(
            equalTo: mainLayoutGuide.bottomAnchor).isActive = true
    }

    // MARK: - Setup Subviews
    private func setupNavigationItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(self.showRestaurants))
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "show restaurants button"
    }

    private func setupViewComponents() {
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
        self.view.addSubview(self.restaurantCardView)
        self.view.addSubview(self.recommendationButton)
    }

    // MARK: - Actions
    func getRecommendation() {
        self.recommendationRepository.findRecommendation()
            .onSuccess { restaurant in
                self.restaurantCardView.setRecommendationText(recommendation: restaurant.name)
            }
            .onFailure { error in
                self.restaurantCardView.setRecommendationText(recommendation: "Not Found")
            }
    }

    func showRestaurants() {
        let restaurantsScreen = RestaurantTableViewController(router: self.router)
        self.router.showScreenAsModal(viewController: restaurantsScreen, animated: true)
    }
}
