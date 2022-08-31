import CoreGraphics
import Foundation

public protocol LockScreenIsActiveUseCaseProtocol {
    func execute() -> Bool
}

public struct LockScreenIsActiveUseCase: LockScreenIsActiveUseCaseProtocol {
    private static let lockedKey = "CGSSessionScreenIsLocked"

    public init() {
    }

    public func execute() -> Bool {
        if let dict = CGSessionCopyCurrentDictionary() as? [String: Any] {
            if let locked = dict[Self.lockedKey] as? Int {
                return locked == 1
            }
        }
        return false
    }
}
