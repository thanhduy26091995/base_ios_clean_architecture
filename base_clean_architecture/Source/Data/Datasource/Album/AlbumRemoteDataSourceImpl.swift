//
//  AlbumRemoteDataSourceImpl.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

import Alamofire

class AlbumRemoteDataSourceImpl: IAlbumRemoteDataSource {
    func getAlbums(completion: @escaping (Result<[AlbumResponse], any Error>) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/albums")
            .validate()
            .responseDecodable(of: [AlbumResponse].self, completionHandler: { response in
                switch response.result {
                case .success(let albums):
                    completion(.success(albums))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
    
    func getAlbumDetail(albumId: Int, completion: @escaping (Result<AlbumResponse, any Error>) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/albums/\(albumId)")
            .validate()
            .responseDecodable(of: AlbumResponse.self, completionHandler: { response in
                switch response.result {
                case .success(let album):
                    completion(.success(album))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
}
