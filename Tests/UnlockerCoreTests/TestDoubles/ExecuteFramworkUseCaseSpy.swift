import Foundation
@testable import UnlockerCore

class ExecuteFramworkUseCaseSpy: ExecuteFramworkUseCaseProtocol {
    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }
    var executeCall: (frameworkPath: String, function: String)?

    func execute(frameworkPath: String, function: String) {
        executeCall = (frameworkPath: frameworkPath, function: function)
        executeCalledTimes += 1
    }
}
