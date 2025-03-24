//
//  DIContainerTest.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

@testable import base_clean_architecture
import Factory

extension Container {
    var albumRepository: Factory<IAlbumRepository> {
        self {
            MockAlbumRepository()
        }
    }
}

class MockAlbumRepository: IAlbumRepository {
    func getAlbums(completion: @escaping (Result<[base_clean_architecture.DTOAlbum], any Error>) -> Void) {
        completion(.success([DTOAlbum(id: 1, userId: 1, title: "Testing album"), DTOAlbum(id: 1, userId: 1, title: "Testing album")]))
    }
    
    func getAlbumDetail(albumId: Int, completion: @escaping (Result<base_clean_architecture.DTOAlbum, any Error>) -> Void) {
        completion(.success(DTOAlbum(id: 1, userId: 1, title: "Testing album")))
    }
}

class MockErrorAlbumRepository: IAlbumRepository {
    func getAlbums(completion: @escaping (Result<[DTOAlbum], any Error>) -> Void) {
        completion(.failure(AppError.custom(message: "No data found")))
    }
    
    func getAlbumDetail(albumId: Int, completion: @escaping (Result<DTOAlbum, any Error>) -> Void) {
        completion(.failure(AppError.custom(message: "No data found for detail")))
    }
}
