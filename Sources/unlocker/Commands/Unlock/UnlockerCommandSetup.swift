import Foundation
import UnlockerCore

struct UnlockerCommandSetup {
    struct UnlockCommandOptions: Equatable {
        let password: String
    }

    enum UnlockError: Error {
        case notAbleToUnlock
        case noAccessibilityAccess
    }

    private let options: UnlockCommandOptions

    private let lockScreenIsActive: LockScreenIsActiveUseCaseProtocol
    private let wakeScreenUseCase: WakeScreenUseCaseProtocol
    private let unlockScreen: UnlockScreenUseCaseProtocol
    private let stopScreenSaver: StopScreenSaverUseCaseProtocol
    private let accessablityPermissionIsAllowed: AccessablityPermissionIsAllowedUseCaseProtocol

    init(
        options: UnlockCommandOptions,
        lockScreenIsActive: LockScreenIsActiveUseCaseProtocol = LockScreenIsActiveUseCase(),
        wakeScreenUseCase: WakeScreenUseCaseProtocol = WakeScreenUseCase(),
        stopScreenSaver: StopScreenSaverUseCaseProtocol = StopScreenSaverUseCase(),
        unlockScreen: UnlockScreenUseCaseProtocol = UnlockScreenUseCase(),
        checkForAccessablityPermission: AccessablityPermissionIsAllowedUseCaseProtocol
            = AccessablityPermissionIsAllowedUseCase()
    ) {
        self.options = options
        self.lockScreenIsActive = lockScreenIsActive
        self.wakeScreenUseCase = wakeScreenUseCase
        self.unlockScreen = unlockScreen
        self.stopScreenSaver = stopScreenSaver
        self.accessablityPermissionIsAllowed = checkForAccessablityPermission
    }

    func run() throws {
        guard accessablityPermissionIsAllowed.execute() else {
            throw UnlockError.noAccessibilityAccess
        }

        if lockScreenIsActive.execute() {
            wakeScreenUseCase.execute()
        }

        stopScreenSaver.execute()

        try unlockScreen.execute(password: options.password)
    }
}
