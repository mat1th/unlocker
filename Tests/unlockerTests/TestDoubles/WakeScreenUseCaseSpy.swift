import Foundation
@testable import unlocker

class WakeScreenUseCaseSpy: WakeScreenUseCaseProtocol {
    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }

    func execute() {
        executeCalledTimes += 1
    }
}
