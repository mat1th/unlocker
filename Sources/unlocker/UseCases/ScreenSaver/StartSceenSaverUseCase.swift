import Foundation
import IOKit.pwr_mgt

protocol StartSceenSaverUseCaseProtocol {
    func execute()
}

struct StartSceenSaverUseCase: StartSceenSaverUseCaseProtocol {

    private static let displayPath = "IOService:/IOResources/IODisplayWrangler"
    private static let displayIdleFunction = "IORequestIdle"

    func execute() {
        let registery = IORegistryEntryFromPath(kIOMasterPortDefault, Self.displayPath)

        guard registery != 0 else {
            return
        }

        IORegistryEntrySetCFProperty(registery, Self.displayIdleFunction as CFString, kCFBooleanTrue)
        IOObjectRelease(registery)
    }
}
