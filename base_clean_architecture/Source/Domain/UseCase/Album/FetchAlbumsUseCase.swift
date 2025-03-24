//
//  FetchAlbumsUseCase.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

class FetchAlbumsUseCase: AsyncUseCase<Void, [DTOAlbum]> {
    private let repository: IAlbumRepository
    
    init(repository: IAlbumRepository) {
        self.repository = repository
    }
    
    override func build(arg: Void, completion: @escaping (Result<[DTOAlbum], any Error>) -> Void) {
        repository.getAlbums(completion: { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
