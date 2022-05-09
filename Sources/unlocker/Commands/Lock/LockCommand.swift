import ArgumentParser
import UnlockerCore

struct LockCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "lock",
        abstract: "Lock your machine"
    )

    func run() throws {
        guard !LockScreenIsActiveUseCase().execute() else {
            return
        }
        LockScreenUseCase().execute()
    }
}
