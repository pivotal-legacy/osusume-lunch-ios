import XCTest
import BrightFutures
import Result

@testable import OsusumeNetworking

class NetworkRecommendationRepositoryTests: XCTestCase {
    var promise = Promise<NSDictionary, NSError>()
    var networkSession = FakeNetworkSession()
    var repository = NetworkRecommendationRepository()
    var userDefaults = FakeUserDefaults()

    override func setUp() {
        super.setUp()

        self.repository.networkSession = self.networkSession
        self.repository.userDefaults = self.userDefaults
        self.networkSession.dataTaskReturnValue = self.promise.future
    }

    func test_findRecommendation_requestsRestaurantsRecommendationRoute() {
        self.repository.findRecommendation()

        XCTAssertEqual(
            self.networkSession.dataTaskArgs.url?.absoluteString,
            "\(self.repository.apiBase)/recommendations"
        )
        XCTAssertEqual(
            self.networkSession.dataTaskArgs.httpMethod,
            "POST"
        )
    }

    func test_findRecommendation_returnsRestaurant() {
        let expectedRestaurantName = "Afuri"

        self.promise.success(["name": expectedRestaurantName])

        let future = self.repository.findRecommendation()

        let expectation = self.expectation(description: "complete expectation")

        future.onComplete(callback: { result in
            expectation.fulfill()
            XCTAssertTrue(self.userDefaults.getBlacklistIdsWasCalled)
            XCTAssertEqual(expectedRestaurantName, result.value?.name)
        })

        self.waitForExpectations(timeout: 2, handler: nil)
    }
}
