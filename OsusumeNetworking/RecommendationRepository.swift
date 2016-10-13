import Foundation
import BrightFutures

public protocol RecommendationRepository {
    func findRecommendation() -> Future<Restaurant, NSError>
}
