@testable import unlocker
import XCTest

class UnlockCommandTests: XCTestCase {
    private var sut: UnlockCommand!

    private var lockScreenIsActiveUseCaseSpy: LockScreenIsActiveUseCaseSpy!
    private var wakeScreenUseCaseSpy: WakeScreenUseCaseSpy!
    private var stopScreenSaverUseCaseSpy: StopScreenSaverUseCaseSpy!
    private var unlockScreenUseCaseSpy: UnlockScreenUseCaseSpy!
    private var accessablityPermissionIsAllowedSpy: AccessablityPermissionIsAllowedSpy!

    override func setUpWithError() throws {
        try super.setUpWithError()

        lockScreenIsActiveUseCaseSpy = LockScreenIsActiveUseCaseSpy()
        wakeScreenUseCaseSpy = WakeScreenUseCaseSpy()
        stopScreenSaverUseCaseSpy = StopScreenSaverUseCaseSpy()
        unlockScreenUseCaseSpy = UnlockScreenUseCaseSpy()
        accessablityPermissionIsAllowedSpy = AccessablityPermissionIsAllowedSpy()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        lockScreenIsActiveUseCaseSpy = nil
        wakeScreenUseCaseSpy = nil
        stopScreenSaverUseCaseSpy = nil
        unlockScreenUseCaseSpy = nil
        accessablityPermissionIsAllowedSpy = nil

        sut = nil
    }

    func testCheckForAccessablity() throws {
        makeSut(options: .init(password: "dummy"))

        accessablityPermissionIsAllowedSpy.result = true

        XCTAssertNoThrow(try sut.run())

        accessablityPermissionIsAllowedSpy.result = false

        XCTAssertThrowsError(try sut.run())
    }

    func testOnlyWakeScreenWhenNeeded() throws {
        makeSut(options: .init(password: "dummy"))

        lockScreenIsActiveUseCaseSpy.result = false

        try sut.run()

        XCTAssertEqual(lockScreenIsActiveUseCaseSpy.executeCalledTimes, 1)
        XCTAssertEqual(wakeScreenUseCaseSpy.executeCalledTimes, 0)

        lockScreenIsActiveUseCaseSpy.result = true

        try sut.run()

        XCTAssertEqual(lockScreenIsActiveUseCaseSpy.executeCalledTimes, 2)
        XCTAssertEqual(wakeScreenUseCaseSpy.executeCalledTimes, 1)
    }

    func testStopsScreenSaverBeforeEnteringPasscode() throws {
        makeSut(options: .init(password: "dummy"))

        try sut.run()

        XCTAssertEqual(stopScreenSaverUseCaseSpy.executeCalledTimes, 1)
    }

    func testEntersPasswordToUnlockScreen() throws {
        makeSut(options: .init(password: "dummy"))

        try sut.run()

        XCTAssertEqual(unlockScreenUseCaseSpy.executeCalledTimes, 1)
    }

    private func makeSut(options: UnlockCommand.UnlockCommandOptions) {
        sut = UnlockCommand(
            options: options,
            lockScreenIsActive: lockScreenIsActiveUseCaseSpy,
            wakeScreenUseCase: wakeScreenUseCaseSpy,
            stopScreenSaver: stopScreenSaverUseCaseSpy,
            unlockScreen: unlockScreenUseCaseSpy,
            checkForAccessablityPermission: accessablityPermissionIsAllowedSpy
        )
    }
}
