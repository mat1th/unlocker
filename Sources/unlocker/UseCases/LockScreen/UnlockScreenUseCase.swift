import Foundation

protocol UnlockScreenUseCaseProtocol {
    func execute(password: String) throws
}

struct UnlockScreenUseCase: UnlockScreenUseCaseProtocol {
    enum UnlockScreenError: Error {
        case passwordNotValid
    }

    private let amountCaracters = 20

    private let postKeyEvent: PostKeyEventUseCaseProtocol
    private let cgEventProvider: (CGEventSource?, CGKeyCode, Bool) -> CGEventProtocol?

    public init(
        postKeyEvent: PostKeyEventUseCaseProtocol = PostKeyEventUseCase(),
        cgEventProvider: @escaping (CGEventSource?, CGKeyCode, Bool) -> CGEventProtocol? = {
            CGEvent(keyboardEventSource: $0, virtualKey: $1, keyDown: $2)
        }
    ) {
        self.cgEventProvider = cgEventProvider
        self.postKeyEvent = postKeyEvent
    }

    func execute(password: String) throws {
        guard password.count > 1 else {
            throw UnlockScreenError.passwordNotValid
        }

        let src = CGEventSource(stateID: .hidSystemState)

        let uniCharCount = password.utf16.count
        var strIndex = password.utf16.startIndex

        for offset in stride(from: 0, to: uniCharCount, by: amountCaracters) {
            let pressEvent = cgEventProvider(src, KeyCode.space.rawValue, true)
            let len = offset + amountCaracters < uniCharCount ? amountCaracters : uniCharCount - offset
            let buffer = UnsafeMutablePointer<UniChar>.allocate(capacity: len)

            for index in 0..<len {
                buffer[index] = password.utf16[strIndex]
                strIndex = password.utf16.index(after: strIndex)
            }
            pressEvent?.keyboardSetUnicodeString(stringLength: len, unicodeString: buffer)
            pressEvent?.post(tap: .cghidEventTap)
            cgEventProvider(src, KeyCode.space.rawValue, false)?.post(tap: .cghidEventTap)
        }

        postKeyEvent.execute(keyCode: KeyCode.enter.rawValue)
    }
}
