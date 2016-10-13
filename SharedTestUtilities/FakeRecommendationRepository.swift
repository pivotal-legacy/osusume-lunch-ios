import Foundation
import BrightFutures
import OsusumeNetworking

@testable import OsusumeLunch

class FakeRecommendationRepository: RecommendationRepository {
    var findRecommendationWasCalled = false
    var findRecommendationReturnValue = Promise<Restaurant, NSError>()

    func findRecommendation() -> Future<Restaurant, NSError> {
        self.findRecommendationWasCalled = true

        return findRecommendationReturnValue.future
    }
}
