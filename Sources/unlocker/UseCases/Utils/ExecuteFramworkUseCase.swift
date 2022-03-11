import Foundation

protocol ExecuteFramworkUseCaseProtocol {
    func execute(frameworkPath: String, function: String)
}

struct ExecuteFramworkUseCase: ExecuteFramworkUseCaseProtocol {
    typealias CFunction = @convention(c) () -> Void

    func execute(frameworkPath: String, function: String) {
        let libHandle = dlopen(frameworkPath, RTLD_LAZY)
        let sym = dlsym(libHandle, function)

        let functionCall = unsafeBitCast(sym, to: CFunction.self)
        functionCall()
    }
}
