import Foundation

protocol LockScreenIsActiveUseCaseProtocol {
    func execute() -> Bool
}

struct LockScreenIsActiveUseCase: LockScreenIsActiveUseCaseProtocol {

    private static let lockedKey = "CGSSessionScreenIsLocked"

    func execute() -> Bool {
        if let dict = CGSessionCopyCurrentDictionary() as? [String: Any] {
            if let locked = dict[Self.lockedKey] as? Int {
                return locked == 1
            }
        }
        return false
    }
}
