//
//  UseCase.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

protocol UseCase {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) throws -> Output
}
