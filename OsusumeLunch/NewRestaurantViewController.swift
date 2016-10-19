import UIKit

class NewRestaurantViewController: UIViewController, UITextFieldDelegate {
    let nameTextField = AutoLayoutTextField()
    var restaurantRepository: RestaurantRepository = NetworkRestaurantRepository()
    var router: Router

    init(router: Router) {
        self.router = router

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
        self.setupNavBar()
        self.setupSubviews()
        self.addConstraints()
    }

    // MARK: - View Setup
    private func setupNavBar() {
        self.navigationItem.title = "Add Spot"
    }

    private func setupSubviews() {
        self.view.backgroundColor = UIColor.brown

        self.nameTextField.backgroundColor = UIColor.white
        self.nameTextField.placeholder = "Name"
        self.nameTextField.becomeFirstResponder()
        self.nameTextField.returnKeyType = UIReturnKeyType.done
        self.nameTextField.delegate = self
    }

    private func addSubviews() {
        self.view.addSubview(self.nameTextField)
    }

    private func addConstraints() {
        let margins = self.view.layoutMarginsGuide

        self.nameTextField.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 5).isActive = true
        self.nameTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        self.nameTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    }


    // MARK: - UITextFieldDelegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveRestaurantAndDismiss()
        return true
    }

    func saveRestaurantAndDismiss() {
        guard let name = self.nameTextField.text, name != "" else {
            return
        }
        self.nameTextField.resignFirstResponder()
        self.restaurantRepository.createRestaurant(name: name)
        self.router.popScreen(animated: true)
    }
}
