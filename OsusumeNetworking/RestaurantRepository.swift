import Foundation
import BrightFutures

public protocol RestaurantRepository {
    func getRecommendation() -> Future<Restaurant, NSError>
}
