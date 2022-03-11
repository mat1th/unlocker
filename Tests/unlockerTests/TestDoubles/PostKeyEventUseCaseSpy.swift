import Foundation
@testable import unlocker

class PostKeyEventUseCaseSpy: PostKeyEventUseCaseProtocol {
    var executeCalledTimes = 0
    var executeCalled: Bool { executeCalledTimes > 0 }

    func execute(keyCode: CGKeyCode) {
        executeCalledTimes += 1
    }
}
