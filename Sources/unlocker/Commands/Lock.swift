import ArgumentParser

struct Lock: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Lock your machine"
    )

    func run() throws {
        guard !LockScreenIsActiveUseCase().execute() else {
            return
        }
        LockScreenUseCase().execute()
    }
}
