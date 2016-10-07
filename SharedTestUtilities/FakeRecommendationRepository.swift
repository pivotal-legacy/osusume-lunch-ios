import Foundation
import BrightFutures
import OsusumeNetworking

@testable import OsusumeLunch

class FakeRecommendationRepository: RecommendationRepository {
    var getRecommendationWasCalled = false
    var getRecommendationReturnValue = Promise<Restaurant, NSError>()

    func getRecommendation() -> Future<Restaurant, NSError> {
        self.getRecommendationWasCalled = true

        return getRecommendationReturnValue.future
    }
}
