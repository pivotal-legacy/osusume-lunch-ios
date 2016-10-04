import Foundation

@testable import OsusumeLunch

class FakeRestaurantRepository: RestaurantRepository {

    var getRecommendationWasCalled = false

    func getRecommendation() -> Restaurant {
        self.getRecommendationWasCalled = true
        
        return Restaurant()
    }
}
