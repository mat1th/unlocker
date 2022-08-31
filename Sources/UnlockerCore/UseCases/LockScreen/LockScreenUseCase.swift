import Foundation

public protocol LockScreenUseCaseProtocol {
    func execute()
}

public struct LockScreenUseCase {
    private static let loginFrameworkPath = "/System/Library/PrivateFrameworks/login.framework/Versions/Current/login"
    private static let lockScreenFunction = "SACLockScreenImmediate"

    private let executeFramwork: ExecuteFramworkUseCaseProtocol

    public init() {
        self.init(executeFramwork: ExecuteFramworkUseCase())
    }

    init(executeFramwork: ExecuteFramworkUseCaseProtocol = ExecuteFramworkUseCase()) {
        self.executeFramwork = executeFramwork
    }

    public func execute() {
        executeFramwork.execute(
            frameworkPath: Self.loginFrameworkPath,
            function: Self.lockScreenFunction
        )
    }
}
