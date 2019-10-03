import XCTest
//import os.log
@testable import SailSDK

final class SailSDKTest: XCTestCase {
    func testExample() {
        if #available(iOS 10.0, macOS 10.12, tvOS 10.0, watchOS 3.0, *) {
            SailDebug().log(message: "Error", category: .viewCycle, type: .default)
            XCTAssert(true)
        } else {
            XCTFail()
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}


