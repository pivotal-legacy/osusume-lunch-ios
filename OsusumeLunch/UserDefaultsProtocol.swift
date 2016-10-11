import Foundation

protocol UserDefaultsProtocol {
    func setBlacklistId(id: Int)
    func getBlacklistIds() -> [Int]
    func removeBlacklistId(id: Int)
}
