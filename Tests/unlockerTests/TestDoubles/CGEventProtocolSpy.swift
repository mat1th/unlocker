import Foundation
@testable import unlocker

class CGEventProtocolSpy: CGEventProtocol {
    var keyboardSetUnicodeStringResult: (Int?, UnsafePointer<UniChar>?)?
    var keyboardSetUnicodeStringCalledTimes = 0
    var keyboardSetUnicodeStringCalled: Bool { keyboardSetUnicodeStringCalledTimes > 1 }
    var postCalledTimes = 0
    var postCalled: Bool { postCalledTimes > 1 }

    func keyboardSetUnicodeString(
        stringLength: Int,
        unicodeString: UnsafePointer<UniChar>?) {
            keyboardSetUnicodeStringResult = (stringLength, unicodeString)
            keyboardSetUnicodeStringCalledTimes += 1
        }

    func post(tap: CGEventTapLocation) {
        postCalledTimes += 1
    }
}
