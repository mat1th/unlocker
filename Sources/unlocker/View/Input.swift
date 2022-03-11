import Foundation

struct Input {
    func askSecureInput(question: String) -> String? {
        var buf = [CChar](repeating: 0, count: 130)
        guard let password = readpassphrase(question, &buf, buf.count, RPP_ECHO_OFF) else {
            return nil
        }
        return String(cString: password)
    }

    func askInput(question: String) -> String? {
        print("\(question)")
        guard let input = readLine(), input.count > 1 else {
            return nil
        }
        return input
    }
}
