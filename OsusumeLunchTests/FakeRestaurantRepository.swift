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
}
