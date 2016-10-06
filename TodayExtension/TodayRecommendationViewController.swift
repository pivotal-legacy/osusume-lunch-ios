import UIKit
import NotificationCenter
import BrightFutures
import Result
import OsusumeNetworking

@objc(TodayRecommendationViewController)
class TodayRecommendationViewController: UIViewController, NCWidgetProviding {

    // MARK: - Properties
    var label = UILabel()
    let defaultText = "🍽Fetching a delicious restaurant..."
    let backgroundPinkColor = UIColor(
        red: 234/255,
        green: 60/255,
        blue: 164/255,
        alpha: 1.0
    )

    var restaurantRepository: RestaurantRepository = NetworkRestaurantRepository()

    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()

        self.view = UIView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 320.0,
                height: 200.0
            )
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(label)

        self.setupStyling()
        self.setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.getRecommendation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.label.text = self.defaultText
    }

    // MARK: - NCWidgetProviding Protocol
    private func widgetPerformUpdate(completionHandler: ((NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.noData)
    }

    // MARK: - View Setup
    private func setupStyling() {
        self.view.backgroundColor = self.backgroundPinkColor

        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textColor = UIColor.black
        self.label.textAlignment = NSTextAlignment.center
        self.label.text = self.defaultText
    }

    private func setupConstraints() {
        let margins = self.view.layoutMarginsGuide

        self.label.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.label.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.label.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.label.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    // MARK: - Actions
    func getRecommendation() {
        self.restaurantRepository.getRecommendation()
            .onSuccess { restaurant in
                self.label.text = restaurant.name
            }
            .onFailure { error in
                self.label.text = "Not Found"
        }
    }
}
