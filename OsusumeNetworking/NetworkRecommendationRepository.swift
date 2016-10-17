import Foundation
import BrightFutures
import Result

public class NetworkRecommendationRepository: NSObject, RecommendationRepository {

    let apiBase = "https://osusume-lunch.cfapps.io"

    override public init() {
        super.init()
    }

    public var networkSession: NetworkSession = URLSession()
    
    public func findRecommendation() -> Future<Restaurant, NSError> {
        let promise = Promise<Restaurant, NSError>()

        let body = ["blacklist": ["ids":[AnyObject]()]]

        let urlRequest = URLRequest.post(
            urlString: self.apiBase + "/recommendations",
            headers: ["Content-Type":"application/json"],
            body: body
        )

        self.networkSession.dataTask(request: urlRequest!)
            .onSuccess { resultDictionary in
                promise.success(
                    Restaurant(dictionary: resultDictionary as! [String: AnyObject])
                )
            }
            .onFailure{ _ in
                promise.failure(
                    NSError(
                        domain: "networkRestaurantRepository_getRecommendation",
                        code: 0,
                        userInfo: nil
                    )
                )
            }

        return promise.future
    }
}
