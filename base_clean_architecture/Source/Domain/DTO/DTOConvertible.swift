//
//  DTOConvertible.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//


protocol DTOConvertible {
    associatedtype DTOType
    
    func asDTO() throws -> DTOType
}
