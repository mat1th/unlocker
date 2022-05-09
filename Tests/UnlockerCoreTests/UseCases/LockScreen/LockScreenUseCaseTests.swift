@testable import UnlockerCore
import XCTest

class LockScreenUseCaseTests: XCTestCase {
    private var sut: LockScreenUseCase!
    private var executeFramworkUseCaseSpy: ExecuteFramworkUseCaseSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()

        executeFramworkUseCaseSpy = ExecuteFramworkUseCaseSpy()
        sut = LockScreenUseCase(executeFramwork: executeFramworkUseCaseSpy)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        executeFramworkUseCaseSpy = nil
        sut = nil
    }

    func testShouldSendKeyEventsWhenFillingInPassword() {
        sut.execute()
        XCTAssertEqual(
            executeFramworkUseCaseSpy.executeCall?.frameworkPath,
            "/System/Library/PrivateFrameworks/login.framework/Versions/Current/login"
        )
        XCTAssertEqual(
            executeFramworkUseCaseSpy.executeCall?.function,
            "SACLockScreenImmediate"
        )
    }
}
