import XCTest
import BrightFutures
import Result
import OsusumeNetworking

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

    func test_getAllRestaurants_returnsRestaurants() {
        let expectedRestaurants = [
            ["id": 1, "name":"Afuri"],
            ["id": 2, "name":"Pizzakaya"],
            ]

        self.promise.success(["restaurants":expectedRestaurants])

        let future = self.repository.getAllRestaurants()

        let expectation = self.expectation(description: "complete expectation")

        future.onComplete(callback: { result in
            expectation.fulfill()
            XCTAssertEqual(result.value!.count, 2)
            XCTAssertEqual(result.value![0].name, "Afuri")
            XCTAssertEqual(result.value![1].name, "Pizzakaya")
            XCTAssertEqual(result.value![0].id, 1)
            XCTAssertEqual(result.value![1].id, 2)
        })
        
        self.waitForExpectations(timeout: 2, handler: nil)
    }
}
