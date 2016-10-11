import Foundation

@testable import OsusumeLunch

class FakeUserDefaults: UserDefaultsProtocol {
    var blackList = [Int]()

    func setBlacklistId(id: Int) {
        blackList.append(id)
    }

    func getBlacklistIds() -> [Int] {
        return blackList
    }

    func removeBlacklistId(id: Int) {
        let maybeIndex = blackList.index(of: id)
        if let index = maybeIndex {
            blackList.remove(at: index)
        }
    }
}
