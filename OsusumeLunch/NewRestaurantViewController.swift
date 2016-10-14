import UIKit

class NewRestaurantViewController: UIViewController {
    let nameTextField = AutoLayoutTextField()
    let nameTextFieldLabel = AutoLayoutLabel()
    let saveButton = AutoLayoutButton()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
        self.setupSubviews()
        self.addSubviews()
        self.addConstraints()
    }

    // MARK: - View Setup
    private func setupNavBar() {
        self.navigationItem.title = "New Restaurant"
    }

    private func setupSubviews() {
        self.view.backgroundColor = UIColor.brown

        self.nameTextFieldLabel.text = "Name"
        self.nameTextField.backgroundColor = UIColor.white
        self.saveButton.setTitle("Save", for: UIControlState.normal)
        self.saveButton.titleLabel?.textColor = UIColor.black
    }

    private func addSubviews() {
        self.view.addSubview(self.nameTextFieldLabel)
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.saveButton)
    }

    private func addConstraints() {
        let margins = self.view.layoutMarginsGuide

        self.nameTextFieldLabel.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor).isActive = true
        self.nameTextFieldLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.nameTextFieldLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        self.nameTextField.topAnchor.constraint(equalTo: self.nameTextFieldLabel.bottomAnchor).isActive = true
        self.nameTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.nameTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        self.saveButton.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor).isActive = true
        self.saveButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    }
}
