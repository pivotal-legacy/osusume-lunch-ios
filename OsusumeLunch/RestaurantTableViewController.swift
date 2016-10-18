import UIKit
import OsusumeNetworking

class RestaurantTableViewController: UITableViewController {

    // MARK: - Properties
    var restaurantRepository: RestaurantRepository = NetworkRestaurantRepository()
    var restaurants: [Restaurant] = [Restaurant]()
    var router: Router = NavigationRouter() 

    let cellReuseIdentifier = "restaurantTableViewCell"

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavbar()
        self.tableView.register(
            RestaurantWhitelistTableViewCell.self,
            forCellReuseIdentifier: String(describing: RestaurantWhitelistTableViewCell.self)
        )

        self.getAllRestaurants()
    }

    // MARK: - View Setup
    private func setupNavbar() {
        self.navigationItem.title = "Lunch Spots"

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.done,
            target: self,
            action: #selector(self.done))
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "done"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.add,
            target: self,
            action: #selector(self.showNewRetaurantScreen))
        self.navigationItem.leftBarButtonItem?.accessibilityIdentifier = "add new restaurant"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantWhitelistTableViewCell.self), for: indexPath) as! RestaurantWhitelistTableViewCell

        cell.setRestaurant(restaurant: self.restaurants[indexPath.row])

        return cell
    }

    // MARK: - Action
    private func getAllRestaurants() {
        self.restaurantRepository.getAllRestaurants()
            .onSuccess { restaurants in
                self.restaurants = restaurants
            }
            .onFailure { error in
                self.restaurants.removeAll()
            }
            .onComplete { _ in
                self.tableView.reloadData()
            }
    }

    @objc
    private func showNewRestaurantScreen() {
        self.navigationController?.pushViewController(NewRestaurantViewController(), animated: true)
    }

    func done() {
        self.router.dismissModal(navigationController: self.navigationController!)
    }

    func showNewRetaurantScreen() {

    }
}
