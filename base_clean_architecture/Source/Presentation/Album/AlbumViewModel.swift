//
//  AlbumViewModel.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

import Factory
import SwiftUI

class AlbumViewModel: ObservableObject {
    @Published var albums: [DTOAlbum] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let fetchAlbumsUseCase: FetchAlbumsUseCase
    
    init(fetchAlbumsUseCase: FetchAlbumsUseCase = Container.shared.fetchAlbumsUseCase()) {
        self.fetchAlbumsUseCase = fetchAlbumsUseCase
    }
    
    func fetchAlbums() {
        fetchAlbumsUseCase.execute(arg: (), config: BaseUseCase.UseCaseConfig(
            onStart: { [weak self] in
                guard let self = self else {
                    return
                }
                
                self.isLoading = true
            },
            onSuccess: { [weak self] data in
                guard let self = self else {
                    return
                }
                
                self.isLoading = false
                self.albums = data
            },
            onError: { [weak self] error in
                guard let self = self else {
                    return
                }
                
                self.isLoading = false
                self.errorMessage = error.localizedDescription
            }
        ))
    }
}
