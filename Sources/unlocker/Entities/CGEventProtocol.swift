import Foundation

protocol CGEventProtocol {
    func keyboardSetUnicodeString(stringLength: Int, unicodeString: UnsafePointer<UniChar>?)

    func post(tap: CGEventTapLocation)
}
