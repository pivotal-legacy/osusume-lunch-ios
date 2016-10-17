import Foundation

@testable import OsusumeNetworking

public class FakeUserDefaults: NSObject, UserDefaultsProtocol {
    var blackList = [Int]()

    public override init() {
        super.init()
    }

    public func setBlacklistId(id: Int) {
        blackList.append(id)
    }

    public func getBlacklistIds() -> [Int] {
        return blackList
    }

    public func removeBlacklistId(id: Int) {
        let maybeIndex = blackList.index(of: id)
        if let index = maybeIndex {
            blackList.remove(at: index)
        }
    }
}
