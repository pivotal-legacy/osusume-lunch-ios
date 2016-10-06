import Foundation

import BrightFutures

public protocol NetworkSession {
    func dataTask(request: URLRequest) -> Future<NSDictionary, NSError>
}
