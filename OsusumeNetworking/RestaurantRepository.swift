import Foundation
import BrightFutures

public protocol RestaurantRepository {
    func getRecommendation() -> Future<Restaurant, NSError>

    func getAllRestaurants() -> Future<[Restaurant], NSError>
}
