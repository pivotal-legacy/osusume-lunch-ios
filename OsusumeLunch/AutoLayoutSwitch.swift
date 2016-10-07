import UIKit

class AutoLayoutSwitch: UISwitch {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func setupAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
