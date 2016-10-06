import XCTest
import BrightFutures
import Result

@testable import OsusumeNetworking

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

    func test_getAllRestaurants_returnsRestaurants() {
        let expectedRestaurants = [
            ["name":"Afuri"],
            ["name":"Pizzakaya"],
        ]

        self.promise.success(["restaurants":expectedRestaurants])

        let future = self.repository.getAllRestaurants()

        let expectation = self.expectation(description: "complete expectation")

        future.onComplete(callback: { result in
            expectation.fulfill()
            XCTAssertEqual(result.value!.count, 2)
            XCTAssertEqual(result.value![0].name, "Afuri")
            XCTAssertEqual(result.value![1].name, "Pizzakaya")
        })

        self.waitForExpectations(timeout: 2, handler: nil)
    }
}
