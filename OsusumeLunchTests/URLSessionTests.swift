import XCTest
import BrightFutures

@testable import OsusumeLunch

class URLSessionTests: XCTestCase {
    var urlSession: URLSession!

    override func setUp() {
        super.setUp()

        self.urlSession = URLSession()
    }
    
    func test_handler_returnsDataIfDataExists() {
        let successDictionary = ["success!":"wow"]
        let promise =  Promise<NSDictionary, NSError>()

        guard let jsonData = try? JSONSerialization.data(withJSONObject: successDictionary, options: []) else {
            XCTFail()
            return
        }

        self.urlSession.handler(
            data: jsonData,
            response: nil,
            error: nil,
            promise: promise
        )

        XCTAssertEqual(promise.future.value as! Dictionary<String, String>, successDictionary)
    }

    func test_handler_returnsErrorIfDataIsEmpty() {
        let failError = NSError(domain: "urlSession_handler", code: 0, userInfo: nil)


        let promise =  Promise<NSDictionary, NSError>()

        self.urlSession.handler(
            data: nil,
            response: nil,
            error: failError,
            promise: promise
        )

        XCTAssertEqual(promise.future.error!, failError)
    }
}
