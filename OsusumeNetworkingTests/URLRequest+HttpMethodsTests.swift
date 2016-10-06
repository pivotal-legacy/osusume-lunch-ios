import XCTest

@testable import OsusumeNetworking

class URLRequest_HttpMethodsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func test_get_setsPathAndHeaders() {
        let headers = ["Content-Type": "application/json"]
        let urlRequest = URLRequest.get(urlString: "http://example.com", headers: headers)

        let expectedUrl = URL(string: "http://example.com")

        XCTAssertEqual(urlRequest!.httpMethod, "GET")
        XCTAssertEqual(urlRequest!.url, expectedUrl)
        XCTAssertEqual(urlRequest!.allHTTPHeaderFields!, headers)
    }

    func test_get_returnsNilForBadUrl() {
        let headers = [String:String]()
        let urlRequest = URLRequest.get(urlString: "\\\\\\", headers: headers)

        XCTAssertNil(urlRequest)
    }
}
