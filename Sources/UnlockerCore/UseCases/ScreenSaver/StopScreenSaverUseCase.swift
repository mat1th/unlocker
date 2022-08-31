import Foundation

public protocol StopScreenSaverUseCaseProtocol {
    func execute()
}

public struct StopScreenSaverUseCase: StopScreenSaverUseCaseProtocol {
    private let postKeyEvent: PostKeyEventUseCaseProtocol

    public init() {
        self.init(postKeyEvent: PostKeyEventUseCase())
    }

    init(postKeyEvent: PostKeyEventUseCaseProtocol = PostKeyEventUseCase()) {
        self.postKeyEvent = postKeyEvent
    }

    public func execute() {
        postKeyEvent.execute(keyCode: KeyCode.escape.rawValue)
    }
}
