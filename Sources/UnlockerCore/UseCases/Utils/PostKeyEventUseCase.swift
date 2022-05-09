import Foundation

public protocol PostKeyEventUseCaseProtocol {
    func execute(keyCode: CGKeyCode)
}

public struct PostKeyEventUseCase: PostKeyEventUseCaseProtocol {
    private let src = CGEventSource(stateID: .hidSystemState)

    public init() {
    }

    public func execute(keyCode: CGKeyCode) {
        CGEvent(keyboardEventSource: src, virtualKey: keyCode, keyDown: true)?.post(tap: .cghidEventTap)
        CGEvent(keyboardEventSource: src, virtualKey: keyCode, keyDown: false)?.post(tap: .cghidEventTap)
    }
}
