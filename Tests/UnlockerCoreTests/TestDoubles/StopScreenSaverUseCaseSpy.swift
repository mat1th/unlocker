import Foundation
@testable import UnlockerCore

class StopScreenSaverUseCaseSpy: StopScreenSaverUseCaseProtocol {
    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }

    func execute() {
        executeCalledTimes += 1
    }
}
