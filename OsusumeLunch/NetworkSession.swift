import Foundation

import BrightFutures

protocol NetworkSession {
    func dataTask(request: URLRequest) -> Future<NSDictionary, NSError>
}
