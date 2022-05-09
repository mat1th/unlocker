import ArgumentParser
import Cocoa
import Foundation
import Quartz
import ServiceManagement

struct Main: ParsableCommand {
    static var configuration: CommandConfiguration {
        .init(
            commandName: "unlocker",
            abstract: "Control locking and unlocking of your device using the commandline.",
            version: "0.1.0",
            subcommands: [
                UnlockCommand.self,
                LockCommand.self
            ]
        )
    }
}

Main.main()
