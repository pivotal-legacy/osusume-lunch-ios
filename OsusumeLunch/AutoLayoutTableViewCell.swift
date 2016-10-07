import UIKit

class AutoLayoutTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func setupAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
