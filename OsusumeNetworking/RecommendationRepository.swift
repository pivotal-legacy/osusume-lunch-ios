import Foundation
import BrightFutures

public protocol RecommendationRepository {
    func getRecommendation() -> Future<Restaurant, NSError>
}
