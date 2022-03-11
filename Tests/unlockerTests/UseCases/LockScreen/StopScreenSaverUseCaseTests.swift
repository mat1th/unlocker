@testable import unlocker
import XCTest

class StopScreenSaverUseCaseTests: XCTestCase {
    private var sut: StopScreenSaverUseCase!
    private var postKeyEventUseCaseSpy: PostKeyEventUseCaseSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()

        postKeyEventUseCaseSpy = PostKeyEventUseCaseSpy()
        sut = StopScreenSaverUseCase(postKeyEvent: postKeyEventUseCaseSpy)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        postKeyEventUseCaseSpy = nil
        sut = nil
    }

    func testShouldSendKeyEventsWhenFillingInPassword() {
        sut.execute()
        XCTAssertEqual(postKeyEventUseCaseSpy.executeCalledTimes, 1)
    }
}
