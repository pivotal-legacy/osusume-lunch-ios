import Foundation
import BrightFutures

class NetworkRestaurantRepository: RestaurantRepository {

    let apiBase = "http://osusume-lunch.cfapps.io"

    var networkSession: NetworkSession = URLSession()
    
    func getRecommendation() -> Future<Restaurant, NSError> {
        let promise = Promise<Restaurant, NSError>()

        let urlRequest = URLRequest.get(
            urlString: self.apiBase + "/restaurants",
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
