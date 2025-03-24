//
//  CodableAlbum.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

struct AlbumResponse: Codable, DTOConvertible {
    typealias DTOType = DTOAlbum
    
    let id: Int?
    let userId: Int?
    let title: String?
    
    func asDTO() throws -> DTOAlbum {
        guard let id = id,
              let userId = userId else {
            throw AppError.custom(message: "Wrong data returned")
        }
        
        return DTOAlbum(id: id, userId: userId, title: title)
    }
}
