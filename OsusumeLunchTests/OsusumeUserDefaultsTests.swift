import XCTest

@testable import OsusumeLunch

class OsusumeUserDefaultsTests: XCTestCase {
    var defaults:OsusumeUserDefaults!

    override func setUp() {
        super.setUp()
        defaults = OsusumeUserDefaults()
    }

    override func tearDown() {
        super.tearDown()
        defaults.userDefaults.removeObject(forKey: "restaurantsBlacklist")
    }
    
    func test_setBlackListId_withEmptyBlackList() {
        defaults.setBlacklistId(id: 1)

        XCTAssertEqual(defaults.getBlacklistIds(), [1])
    }

    func test_setBlackListId_withExistingBlackList() {
        defaults.userDefaults.set([1], forKey: "restaurantsBlacklist")

        defaults.setBlacklistId(id: 2)

        XCTAssertEqual(defaults.getBlacklistIds(), [1, 2])
    }

    func test_removeBlackListId_withEmptyBlacklist() {
        defaults.removeBlacklistId(id: 2)

        XCTAssertEqual(defaults.getBlacklistIds(), [])
    }

    func test_removeBlackListId_withExistingId() {
        defaults.userDefaults.set([1,2,3], forKey: "restaurantsBlacklist")

        defaults.removeBlacklistId(id: 2)

        XCTAssertEqual(defaults.getBlacklistIds(), [1, 3])
    }
}
