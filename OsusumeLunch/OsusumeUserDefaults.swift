import Foundation

class OsusumeUserDefaults: UserDefaultsProtocol {
    static let key = "restaurantsBlacklist"
    var userDefaults = UserDefaults.standard

    func setBlacklistId(id: Int) {
        guard blacklist() != nil else {
            userDefaults.set([id], forKey: OsusumeUserDefaults.key)
            return
        }
        userDefaults.set(getBlacklistIds() + [id], forKey: OsusumeUserDefaults.key)
    }

    func getBlacklistIds() -> [Int] {
        guard let blacklist = blacklist() else {
            return []
        }
        return blacklist
    }

    func removeBlacklistId(id: Int) {
        guard blacklist() != nil else {
            return
        }
        userDefaults.set(getBlacklistIds().filter{$0 != id}, forKey: OsusumeUserDefaults.key)
    }

    private func blacklist() -> [Int]? {
        return userDefaults.object(forKey: OsusumeUserDefaults.key) as? [Int]
    }
}
