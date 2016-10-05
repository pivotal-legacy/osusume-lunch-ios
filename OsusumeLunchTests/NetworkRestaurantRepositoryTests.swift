import XCTest
import BrightFutures
import Result

@testable import OsusumeLunch

class NetworkRestaurantRepositoryTests: XCTestCase {
    var promise = Promise<NSDictionary, NSError>()
    var networkSession = FakeNetworkSession()
    var repository = NetworkRestaurantRepository()

    override func setUp() {
        super.setUp()

        self.repository.networkSession = self.networkSession
        self.networkSession.dataTaskReturnValue = self.promise.future
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
