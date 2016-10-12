import UIKit
import OsusumeNetworking

class RestaurantWhitelistTableViewCell: AutoLayoutTableViewCell {
    var restaurantId: Int!
    var userDefaults:UserDefaultsProtocol = OsusumeUserDefaults()
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
        self.whitelistSwitch.addTarget(
            self,
            action: #selector(addBlackList(switchState:)),
            for: UIControlEvents.valueChanged
        )
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
        self.restaurantId = restaurant.id
        self.restaurantNameLabel.text = restaurant.name
        if userDefaults.getBlacklistIds().index(of: restaurant.id) != nil {
            self.whitelistSwitch.setOn(false, animated: false)
        } else {
            self.whitelistSwitch.setOn(true, animated: false)
        }
    }

    func addBlackList(switchState: UISwitch) {
        if (switchState.isOn) {
            userDefaults.removeBlacklistId(id: restaurantId)
        } else {
            userDefaults.setBlacklistId(id: restaurantId)
        }
    }
}
