//
//  AlbumRepository.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

class AlbumRepositoryImpl: IAlbumRepository {
    private let dataSource: IAlbumRemoteDataSource
    
    init(dataSource: IAlbumRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    func getAlbums(completion: @escaping (Result<[DTOAlbum], any Error>) -> Void) {
        dataSource.getAlbums(completion: { result in
            switch result {
            case .success(let data):
                completion(.success(data.compactMap {
                    try? $0.asDTO()
                }))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func getAlbumDetail(albumId: Int, completion: @escaping (Result<DTOAlbum, any Error>) -> Void) {
        dataSource.getAlbumDetail(albumId: albumId, completion: { result in
            switch result {
            case .success(let data):
                guard let dto = try? data.asDTO() else {
                    completion(.failure(AppError.custom(message: "Wrong data returned")))
                    return
                }
                completion(.success(dto))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
