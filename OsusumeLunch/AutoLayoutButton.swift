import Foundation
import UIKit

class AutoLayoutButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.setupAutoLayout()
    }

    private func setupAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
