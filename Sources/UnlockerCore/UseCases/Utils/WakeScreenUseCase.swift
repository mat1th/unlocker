import Foundation
import IOKit.pwr_mgt

public protocol WakeScreenUseCaseProtocol {
    func execute()
}

public struct WakeScreenUseCase: WakeScreenUseCaseProtocol {
    public init() {
    }

    public func execute() {
        var assertionID: IOPMAssertionID = 0
        _ = IOPMAssertionDeclareUserActivity("" as CFString, kIOPMUserActiveLocal, &assertionID)
    }
}
