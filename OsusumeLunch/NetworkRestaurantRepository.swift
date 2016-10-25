import Foundation
import BrightFutures
import Result
import OsusumeNetworking

public class NetworkRestaurantRepository: NSObject, RestaurantRepository {

    let apiBase = "https://osusume-lunch.cfapps.io"

    override public init() {
        super.init()
    }

    public var networkSession: NetworkSession = URLSession()

    public func getAllRestaurants() -> Future<[Restaurant], NSError> {
        let promise = Promise<[Restaurant], NSError>()

        let urlRequest = URLRequest.get(
            urlString: self.apiBase + "/restaurants",
            headers: [String:String]()
        )

        self.networkSession.dataTask(request: urlRequest!)
            .onSuccess { resultDictionary in

                var restaurants = [Restaurant]()

                if let restaurantArray = resultDictionary.value(forKey: "restaurants") as! [NSDictionary]? {
                    for restaurantDictionary: NSDictionary in restaurantArray {
                        let restaurant = Restaurant(dictionary: restaurantDictionary as! [String: AnyObject])
                        
                        restaurants.append(restaurant)
                    }
                }

                promise.success(
                    restaurants
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

    public func createRestaurant(name: String) -> Future<Restaurant, NSError> {
        let promise = Promise<Restaurant, NSError>()

        let urlRequest = URLRequest.post(
            urlString: self.apiBase + "/restaurants",
            headers: [String : String](),
            body: ["restaurant": ["name": name]]
        )

        self.networkSession.dataTask(request: urlRequest!)
            .onSuccess { restaurant in
                promise.success(
                    Restaurant(dictionary: restaurant as! [String : AnyObject])
                )
            }
            .onFailure { _ in
                promise.failure(
                    NSError(
                        domain: "networkRestaurantRepository_createRestaurant",
                        code: 0,
                        userInfo: nil
                    )
                )
            }
        return promise.future
    }

    public func deleteRestaurant(id: Int) {
        let url = URL(string: self.apiBase + "/restaurants/" + id.description)!
        var request: URLRequest = URLRequest(url: url)

        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        self.networkSession.dataTask(request: request)
            .onComplete {_ in 
                return
            }
    }
}
