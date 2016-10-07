import Foundation

public struct Restaurant {
    public var id = 0
    public var name = ""

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    public init(dictionary: [String: AnyObject]) {
        if let nameString = dictionary["name"] as? String {
            self.name = nameString
        }
        if let idInt = dictionary["id"] as? Int {
            self.id = idInt
        }
    }
}

extension Restaurant: Equatable {
    public static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id &&
            lhs.hashValue == rhs.hashValue
    }
}

extension Restaurant: Hashable {
    public var hashValue: Int {
        return "\(self.name)".hashValue
    }
}
