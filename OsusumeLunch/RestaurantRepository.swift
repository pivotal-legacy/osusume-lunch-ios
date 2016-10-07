import Foundation
import BrightFutures
import OsusumeNetworking

public protocol RestaurantRepository {
    func getAllRestaurants() -> Future<[Restaurant], NSError>
}
