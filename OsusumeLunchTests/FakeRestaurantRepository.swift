import Foundation
import BrightFutures

@testable import OsusumeLunch

class FakeRestaurantRepository: RestaurantRepository {

    var getRecommendationWasCalled = false
    var getRecommendationReturnValue = Future<Restaurant, NSError>()

    func getRecommendation() -> Future<Restaurant, NSError> {
        self.getRecommendationWasCalled = true
        
        return getRecommendationReturnValue
    }
}
