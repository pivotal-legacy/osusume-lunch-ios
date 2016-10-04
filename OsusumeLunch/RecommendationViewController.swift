import Foundation
import UIKit

class RecommendationViewController: UIViewController {

    var recommendationButton = AutoLayoutButton()
    var restaurantRepository: RestaurantRepository = NetworkRestaurantRepository()

    init() {
        super.init(nibName: nil, bundle: nil)

        self.setupButton()
        self.setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
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

    private func setupSubviews() {
        self.view.addSubview(self.recommendationButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let margins = self.view.layoutMarginsGuide

        self.recommendationButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true

        self.recommendationButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.recommendationButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.recommendationButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
    }

    func getRecommendation() {
        self.restaurantRepository.getRecommendation()
    }
}
