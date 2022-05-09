import Foundation
@testable import UnlockerCore

class AccessablityPermissionIsAllowedSpy: AccessablityPermissionIsAllowedUseCaseProtocol {
    var result = true

    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }

    func execute() -> Bool {
        executeCalledTimes += 1
        return result
    }
}
