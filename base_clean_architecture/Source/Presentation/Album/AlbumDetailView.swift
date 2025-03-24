//
//  AlbumDetailView.swift
//  base_clean_architecture
//
//  Created by Duy Bui on 24/3/25.
//

import SwiftUI

struct AlbumDetailView: View {
    let album: DTOAlbum
    
    var body: some View {
        VStack {
            Text(album.title ?? "")
                .font(.headline)
            Text(album.userId.description)
        }
        .navigationTitle("Album Detail")
    }
}
