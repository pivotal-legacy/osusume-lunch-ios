import UIKit

class RestaurantCardView: UIView {
    var recommendationLabel: AutoLayoutLabel

    override init(frame: CGRect) {
        self.recommendationLabel = AutoLayoutLabel()

        super.init(frame: frame)
        self.setupAutoLayout()
        self.addSubviews()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func addSubviews() {
        self.addSubview(self.recommendationLabel)
        self.recommendationLabel.textAlignment = .center
        self.recommendationLabel.textColor = UIColor.purple
    }

    func setConstraint() {
        self.recommendationLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
        self.recommendationLabel.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor).isActive = true
    }

    func setRecommendationText(recommendation: String) {
        self.recommendationLabel.text = recommendation
    }
}
