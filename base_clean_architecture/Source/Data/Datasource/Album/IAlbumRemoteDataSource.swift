//
//  IAlbumRemoteDataSource.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

protocol IAlbumRemoteDataSource {
    func getAlbums(completion: @escaping (Result<[AlbumResponse], Error>) -> Void)
    func getAlbumDetail(albumId: Int, completion: @escaping (Result<AlbumResponse, Error>) -> Void)
}
