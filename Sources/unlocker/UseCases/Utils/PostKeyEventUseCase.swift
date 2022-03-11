import Foundation

protocol PostKeyEventUseCaseProtocol {
    func execute(keyCode: CGKeyCode)
}

struct PostKeyEventUseCase: PostKeyEventUseCaseProtocol {
    private let src = CGEventSource(stateID: .hidSystemState)

    func execute(keyCode: CGKeyCode) {
        CGEvent(keyboardEventSource: src, virtualKey: keyCode, keyDown: true)?.post(tap: .cghidEventTap)
        CGEvent(keyboardEventSource: src, virtualKey: keyCode, keyDown: false)?.post(tap: .cghidEventTap)
    }
}
