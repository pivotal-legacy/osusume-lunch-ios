import Foundation
import BrightFutures

extension URLSession: NetworkSession {

    public func dataTask(request: URLRequest) -> Future<NSDictionary, NSError> {
        let promise = Promise<NSDictionary, NSError>()

         URLSession.shared.dataTask(
            with: request,
            completionHandler: {
                (data: Data?, response: URLResponse?, error: Error?) in

                self.handler(
                    data: data,
                    response: response,
                    error: error,
                    promise: promise
                )
            }
        ).resume()

        return promise.future
    }

    func handler(data: Data?, response: URLResponse?, error: Error?, promise: Promise<NSDictionary, NSError>) {
        if let actualData = data {
            guard let collection = try? JSONSerialization.jsonObject(with: actualData, options: []) as! NSDictionary else {

                return promise.failure(NSError(domain: "urlSession_handler", code: 0, userInfo: nil))
            }

            return promise.success(collection)
        }

        return promise.failure(NSError(domain: "urlSession_handler", code: 0, userInfo: nil))
    }
}
