import Foundation

public protocol ExecuteFramworkUseCaseProtocol {
    func execute(frameworkPath: String, function: String)
}

public struct ExecuteFramworkUseCase: ExecuteFramworkUseCaseProtocol {
    typealias CFunction = @convention(c) () -> Void

    public init() {
    }

    public func execute(frameworkPath: String, function: String) {
        let libHandle = dlopen(frameworkPath, RTLD_LAZY)
        let sym = dlsym(libHandle, function)

        let functionCall = unsafeBitCast(sym, to: CFunction.self)
        functionCall()
    }
}
