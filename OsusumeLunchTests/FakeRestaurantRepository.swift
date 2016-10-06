import Foundation
import BrightFutures
import OsusumeNetworking

@testable import OsusumeLunch

class FakeRestaurantRepository: RestaurantRepository {

    var getRecommendationWasCalled = false
    var getRecommendationReturnValue = Promise<Restaurant, NSError>()
    func getRecommendation() -> Future<Restaurant, NSError> {
        self.getRecommendationWasCalled = true

        return getRecommendationReturnValue.future
    }

    var getAllRestaurantsWasCalled = false
    var getAllRestaurantsReturnValue = Promise<[Restaurant], NSError>()
    func getAllRestaurants() -> Future<[Restaurant], NSError> {
        self.getAllRestaurantsWasCalled = true
        
        return self.getAllRestaurantsReturnValue.future
    }
}
