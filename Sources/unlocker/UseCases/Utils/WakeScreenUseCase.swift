import Foundation
import IOKit.pwr_mgt

protocol WakeScreenUseCaseProtocol {
    func execute()
}

struct WakeScreenUseCase: WakeScreenUseCaseProtocol {
    func execute() {
        var assertionID: IOPMAssertionID = 0
        _ = IOPMAssertionDeclareUserActivity("" as CFString, kIOPMUserActiveLocal, &assertionID)
    }
}
