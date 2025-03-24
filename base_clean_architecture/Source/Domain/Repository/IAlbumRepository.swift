//
//  IAlbumRepository.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//


protocol IAlbumRepository {
    func getAlbums(completion: @escaping (Result<[DTOAlbum], Error>) -> Void)
    func getAlbumDetail(albumId: Int, completion: @escaping (Result<DTOAlbum, Error>) -> Void)
}
