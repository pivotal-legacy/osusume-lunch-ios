import UIKit

class NewRestaurantViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavBar()
    }

    // MARK: - View Setup
    private func setupNavBar() {
        self.navigationItem.title = "New Restaurant"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
