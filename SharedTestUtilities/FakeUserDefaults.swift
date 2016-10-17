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

    public var getBlacklistIdsWasCalled = false
    public func getBlacklistIds() -> [Int] {
        getBlacklistIdsWasCalled = true
        return blackList
    }

    public func removeBlacklistId(id: Int) {
        let maybeIndex = blackList.index(of: id)
        if let index = maybeIndex {
            blackList.remove(at: index)
        }
    }
}
