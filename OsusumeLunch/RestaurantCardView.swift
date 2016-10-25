import UIKit

class RestaurantCardView: UIView {
    var titleLabel: AutoLayoutLabel
    var recommendationLabel: AutoLayoutLabel
    let titleString = "How about lunch at..."

    override init(frame: CGRect) {
        self.titleLabel = AutoLayoutLabel()
        self.recommendationLabel = AutoLayoutLabel()

        super.init(frame: frame)
        self.setupAutoLayout()

        self.setSubviewsConfiguration()
        self.addSubviews()
        self.setConstraint()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    func setSubviewsConfiguration() {
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor =
            UIColor(red: 66.0/255.0, green: 70.0/255.0, blue: 73.0/255.0, alpha: 1.0)
        
        self.recommendationLabel.textAlignment = .center
        self.recommendationLabel.textColor =
            UIColor(red: 255.0/255.0, green: 106.0/255.0, blue: 106.0/255.0, alpha: 1.0)
    }

    func addSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.recommendationLabel)
    }

    func setConstraint() {
        self.recommendationLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
        self.recommendationLabel.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor).isActive = true

        self.titleLabel.bottomAnchor.constraint(equalTo: self.recommendationLabel.topAnchor).isActive = true
        self.titleLabel.centerXAnchor.constraint(equalTo: self.layoutMarginsGuide.centerXAnchor).isActive = true
    }

    func setRecommendationText(recommendation: String) {
        self.titleLabel.text = self.titleString
        self.recommendationLabel.text = recommendation
    }
}
