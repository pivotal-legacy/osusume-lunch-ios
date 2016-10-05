import Foundation
import BrightFutures

protocol RestaurantRepository {
    func getRecommendation() -> Future<Restaurant, NSError>
}
