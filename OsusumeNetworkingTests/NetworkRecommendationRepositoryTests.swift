import XCTest
import BrightFutures
import Result

@testable import OsusumeNetworking

class NetworkRecommendationRepositoryTests: XCTestCase {
    var promise = Promise<NSDictionary, NSError>()
    var networkSession = FakeNetworkSession()
    var repository = NetworkRecommendationRepository()

    override func setUp() {
        super.setUp()

        self.repository.networkSession = self.networkSession
        self.networkSession.dataTaskReturnValue = self.promise.future
    }

    func test_getRecommendation_requestsRestaurantsRecommendationRoute() {
        self.repository.getRecommendation()

        XCTAssertEqual(
            self.networkSession.dataTaskArgs.url?.absoluteString,
            "\(self.repository.apiBase)/restaurants/recommendation"
        )
        XCTAssertEqual(
            self.networkSession.dataTaskArgs.httpMethod,
            "GET"
        )
    }

    func test_getRecommendation_returnsRestaurant() {
        let expectedRestaurantName = "Afuri"

        self.promise.success(["name": expectedRestaurantName])

        let future = self.repository.getRecommendation()

        let expectation = self.expectation(description: "complete expectation")

        future.onComplete(callback: { result in
            expectation.fulfill()
            XCTAssertEqual(expectedRestaurantName, result.value?.name)
        })

        self.waitForExpectations(timeout: 2, handler: nil)
    }
}
