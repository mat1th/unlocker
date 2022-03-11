import Foundation

protocol StopScreenSaverUseCaseProtocol {
    func execute()
}

struct StopScreenSaverUseCase: StopScreenSaverUseCaseProtocol {
    private let postKeyEvent: PostKeyEventUseCaseProtocol

    init(postKeyEvent: PostKeyEventUseCaseProtocol = PostKeyEventUseCase()) {
        self.postKeyEvent = postKeyEvent
    }

    func execute() {
        postKeyEvent.execute(keyCode: KeyCode.escape.rawValue)
    }
}
