//
//  BaseUseCase.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

class BaseUseCase<Arg, ReturnType> {
    class UseCaseConfig<T> {
        var onStart: () -> Void
        var onSuccess: (T) -> Void
        var onError: (Error) -> Void
        
        init(onStart: @escaping () -> Void, onSuccess: @escaping (T) -> Void, onError: @escaping (Error) -> Void) {
            self.onStart = onStart
            self.onSuccess = onSuccess
            self.onError = onError
        }
    }
}
