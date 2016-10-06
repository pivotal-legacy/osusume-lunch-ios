import Foundation
import BrightFutures

@testable import OsusumeNetworking

class FakeNetworkSession: NetworkSession {
    var dataTaskReturnValue = Future<NSDictionary, NSError>()
    var dataTaskArgs = URLRequest(url: URL(string: "http://wwww.example.com")!)

    func dataTask(request: URLRequest) -> Future<NSDictionary, NSError> {
        self.dataTaskArgs = request
        return self.dataTaskReturnValue
    }

}
