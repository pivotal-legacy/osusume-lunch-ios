import UIKit
import OsusumeNetworking

class RestaurantWhitelistTableViewCell: AutoLayoutTableViewCell {
    var restaurantNameLabel = AutoLayoutLabel()
    var whitelistSwitch = AutoLayoutSwitch()

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setInitialState()
        self.addSubviews()
        self.setupSubviewAutoLayout()
    }

    private func setInitialState() {
        self.whitelistSwitch.setOn(true, animated: false)
    }

    private func addSubviews() {
        self.contentView.addSubview(self.restaurantNameLabel)
        self.contentView.addSubview(self.whitelistSwitch)
    }

    private func setupSubviewAutoLayout() {
        let margins = self.contentView.layoutMarginsGuide

        self.restaurantNameLabel.heightAnchor.constraint(equalTo: margins.heightAnchor).isActive = true
        self.restaurantNameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.restaurantNameLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

        self.whitelistSwitch.heightAnchor.constraint(equalTo: margins.heightAnchor).isActive = true
        self.whitelistSwitch.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        self.whitelistSwitch.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    func setRestaurant(restaurant: Restaurant) {
        self.restaurantNameLabel.text = restaurant.name
    }
}
