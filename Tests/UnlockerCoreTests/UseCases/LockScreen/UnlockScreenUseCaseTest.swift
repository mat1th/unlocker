@testable import UnlockerCore
import XCTest

class UnlockScreenUseCaseTest: XCTestCase {
    private var sut: UnlockScreenUseCase!
    private var postKeyEventUseCaseSpy: PostKeyEventUseCaseSpy!
    private lazy var cgEventProvider: (CGEventSource?, CGKeyCode, Bool) -> CGEventProtocol? = {_, _, _ in
        self.cgEventProtocolSpy
    }
    private var cgEventProtocolSpy: CGEventProtocolSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()

        postKeyEventUseCaseSpy = PostKeyEventUseCaseSpy()
        cgEventProtocolSpy = CGEventProtocolSpy()
        sut = UnlockScreenUseCase(
            postKeyEvent: postKeyEventUseCaseSpy,
            cgEventProvider: cgEventProvider
        )
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        postKeyEventUseCaseSpy = nil
        sut = nil
    }

    func testSendKeyEventsWhenFillingInPassword() throws {
        let password = "test"
        try sut.execute(password: password)
        XCTAssertEqual(postKeyEventUseCaseSpy.executeCalledTimes, 1)

        XCTAssertEqual(cgEventProtocolSpy.keyboardSetUnicodeStringResult?.0, 4)
        XCTAssertEqual(cgEventProtocolSpy.keyboardSetUnicodeStringResult?.1?.pointee, 116)
        XCTAssertEqual(cgEventProtocolSpy.keyboardSetUnicodeStringCalledTimes, 1)

        XCTAssertEqual(cgEventProtocolSpy.postCalledTimes, 2)
    }

    func testFailOnEmptyPassword() throws {
        let password = ""
        XCTAssertThrowsError(try sut.execute(password: password))
    }
}
