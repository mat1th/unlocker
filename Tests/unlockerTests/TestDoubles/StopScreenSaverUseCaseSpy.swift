import Foundation
@testable import unlocker

class StopScreenSaverUseCaseSpy: StopScreenSaverUseCaseProtocol {

    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }

    func execute() {
        executeCalledTimes += 1
    }
}
