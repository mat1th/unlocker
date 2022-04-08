import Foundation
import Quartz
import ServiceManagement

protocol AccessablityPermissionIsAllowedUseCaseProtocol {
    func execute() -> Bool
}

struct AccessablityPermissionIsAllowedUseCase: AccessablityPermissionIsAllowedUseCaseProtocol {

    private let postKeyEvent: PostKeyEventUseCaseProtocol

    init(postKeyEvent: PostKeyEventUseCaseProtocol = PostKeyEventUseCase()) {
        self.postKeyEvent = postKeyEvent
    }

    func execute() -> Bool {
        postKeyEvent.execute(keyCode: KeyCode.escape.rawValue)
        return AXIsProcessTrusted()
    }
}
