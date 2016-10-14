import Foundation
import BrightFutures
import OsusumeNetworking

@testable import OsusumeLunch

class FakeRestaurantRepository: RestaurantRepository {
    var getAllRestaurantsWasCalled = false
    var getAllRestaurantsReturnValue = Promise<[Restaurant], NSError>()
    func getAllRestaurants() -> Future<[Restaurant], NSError> {
        self.getAllRestaurantsWasCalled = true
        return self.getAllRestaurantsReturnValue.future
    }

    var createRestaurantWasCalled = false
    var createRestaurantReturnValue = Promise<Restaurant, NSError>()
    func createRestaurant(name: String) -> Future<Restaurant, NSError> {
        self.createRestaurantWasCalled = true
        return self.createRestaurantReturnValue.future
    }
}
