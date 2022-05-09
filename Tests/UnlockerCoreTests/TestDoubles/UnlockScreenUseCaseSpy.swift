import Foundation
@testable import UnlockerCore

class UnlockScreenUseCaseSpy: UnlockScreenUseCaseProtocol {
    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }

    func execute(password: String) throws {
        executeCalledTimes += 1
    }
}
