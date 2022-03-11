import ArgumentParser
import Foundation

struct Unlock: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Unlock your machine (will ask for your password to unlock)"
    )

    @Option(
        name: .shortAndLong,
        help: "Check if machine is correctly unlocked.",
        completion: CompletionKind.list(["true", "false"])
    )
    var unlockCheck = true

    func run() throws {
        let password = try askPassword()
        let options = UnlockCommand.UnlockCommandOptions(
            password: password,
            unlockCheck: unlockCheck
        )

        do {
            try UnlockCommand(options: options).run()
        } catch UnlockCommand.UnlockError.noAccessibilityAccess {
            throw ValidationError("Unlocker does not have access to accessibility.")
        } catch UnlockCommand.UnlockError.notAbleToUnlock {
            throw ValidationError("Password is wrong, please enter correct password.")
        } catch {
            throw ValidationError("Something went wrong, please try again.")
        }
    }

    private func askPassword() throws -> String {
        let input = Input()
        guard let password = input.askSecureInput(question: "Password:"),
              password.count > 1 else {
            throw ValidationError("Password should be at least 1 character.")
        }
        return password
    }
}
