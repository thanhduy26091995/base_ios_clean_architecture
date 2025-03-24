//
//  AlbumView.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

import SwiftUI
import Factory

struct AlbumView: View {
    @StateObject private var viewModel = Container.shared.albumsViewModel()
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading Albums...")
            }
            
            List(viewModel.albums, id: \.id) { album in
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    Text(album.title ?? "")
                }
            }.navigationTitle("")
        }.onAppear {
            viewModel.fetchAlbums()
        }
    }
}

#Preview {
    AlbumView()
}
