import Foundation
import Quartz
import ServiceManagement

public protocol AccessablityPermissionIsAllowedUseCaseProtocol {
    func execute() -> Bool
}

public struct AccessablityPermissionIsAllowedUseCase: AccessablityPermissionIsAllowedUseCaseProtocol {
    private let postKeyEvent: PostKeyEventUseCaseProtocol

    public init() {
        self.init(postKeyEvent: PostKeyEventUseCase())
    }

    private init(postKeyEvent: PostKeyEventUseCaseProtocol = PostKeyEventUseCase()) {
        self.postKeyEvent = postKeyEvent
    }

    public func execute() -> Bool {
        postKeyEvent.execute(keyCode: KeyCode.escape.rawValue)
        return AXIsProcessTrusted()
    }
}
