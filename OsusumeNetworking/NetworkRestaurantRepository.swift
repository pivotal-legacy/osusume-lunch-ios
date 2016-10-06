import Foundation
import BrightFutures
import Result

public class NetworkRestaurantRepository: NSObject, RestaurantRepository {

    let apiBase = "https://osusume-lunch.cfapps.io"

    override public init() {
        super.init()
    }

    public var networkSession: NetworkSession = URLSession()
    
    public func getRecommendation() -> Future<Restaurant, NSError> {
        let promise = Promise<Restaurant, NSError>()

        let urlRequest = URLRequest.get(
            urlString: self.apiBase + "/restaurants/recommendation",
            headers: [String:String]()
        )

        self.networkSession.dataTask(request: urlRequest!)
            .onSuccess { resultDictionary in
                promise.success(
                    Restaurant(name: resultDictionary.value(forKey: "name") as! String)
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
