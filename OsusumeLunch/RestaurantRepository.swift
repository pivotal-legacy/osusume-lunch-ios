import Foundation
import BrightFutures
import OsusumeNetworking

public protocol RestaurantRepository {
    func getAllRestaurants() -> Future<[Restaurant], NSError>
    func createRestaurant(name: String) -> Future<Restaurant, NSError>
    func deleteRestaurant(id: Int)
}
