import Foundation

protocol LockScreenUseCaseProtocol {
    func execute()
}

struct LockScreenUseCase {
    private static let loginFrameworkPath = "/System/Library/PrivateFrameworks/login.framework/Versions/Current/login"
    private static let lockScreenFunction = "SACLockScreenImmediate"

    private let executeFramwork: ExecuteFramworkUseCaseProtocol

    init(executeFramwork: ExecuteFramworkUseCaseProtocol = ExecuteFramworkUseCase()) {
        self.executeFramwork = executeFramwork
    }

    func execute() {
        executeFramwork.execute(
            frameworkPath: Self.loginFrameworkPath,
            function: Self.lockScreenFunction
        )
    }
}
