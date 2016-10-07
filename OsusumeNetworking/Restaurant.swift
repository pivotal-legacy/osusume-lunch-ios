import Foundation

public struct Restaurant {
    public var name = ""

    public init(name: String) {
        self.name = name
    }
}

extension Restaurant: Equatable {
    public static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

extension Restaurant: Hashable {
    public var hashValue: Int {
        return "\(self.name)".hashValue
    }
}
