//
//  AsyncUseCase.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

class AsyncUseCase<Arg, ReturnType>: BaseUseCase<Arg, ReturnType> {
    func build(arg: Arg, completion: @escaping (Result<ReturnType, Error>) -> Void) {
        fatalError("Must be implemented in subclass")
    }
    
    func execute(arg: Arg, config: UseCaseConfig<ReturnType>) {
        config.onStart()
        
        build(arg: arg) { result in
            switch result {
            case .success(let data):
                config.onSuccess(data)
            case .failure(let error):
                config.onError(error)
            }
        }
    }
}
