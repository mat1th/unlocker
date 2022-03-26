import Foundation
import Quartz
import ServiceManagement

protocol AccessablityPermissionIsAllowedUseCaseProtocol {
    func execute() -> Bool
}

struct AccessablityPermissionIsAllowedUseCase: AccessablityPermissionIsAllowedUseCaseProtocol {
    func execute() -> Bool {
        AXIsProcessTrusted()
    }
}
