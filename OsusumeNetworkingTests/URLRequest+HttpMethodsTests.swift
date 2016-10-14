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

    func test_post_setsPathAndHeader() {
        let body = ["restaurant": ["name": "Afuri"]]
        let urlRequest = URLRequest.post(
            urlString: "http://example.com",
            headers: [String: String](),
            body: body
        )

        let expectedUrl = URL(string: "http://example.com")

        XCTAssertEqual(urlRequest!.httpMethod, "POST")
        XCTAssertEqual(urlRequest!.url, expectedUrl)
        XCTAssertEqual(urlRequest!.allHTTPHeaderFields!, ["Content-Type": "application/json"])
    }

    func test_post_returnsNilForBadUrl() {
        let headers = [String:String]()
        let body = ["restaurant": ["name": "Afuri"]]
        let urlRequest = URLRequest.post(urlString: "\\\\\\", headers: headers, body: body)

        XCTAssertNil(urlRequest)
    }
}
