//
//  DIContainer.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

import Factory

extension Container {
    var albumDataSource: Factory<IAlbumRemoteDataSource> {
        self {
            AlbumRemoteDataSourceImpl()
        }
    }
    
    var albumRepository: Factory<IAlbumRepository> {
        self {
            AlbumRepositoryImpl(dataSource: self.albumDataSource())
        }
    }
    
    var fetchAlbumsUseCase: Factory<FetchAlbumsUseCase> {
        self {
            FetchAlbumsUseCase(repository: self.albumRepository())
        }
    }
    
    var albumsViewModel: Factory<AlbumViewModel> {
        self {
            AlbumViewModel(fetchAlbumsUseCase: self.fetchAlbumsUseCase())
        }
    }
}
