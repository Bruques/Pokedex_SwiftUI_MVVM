//
//  PokedexListImageView.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import SwiftUI

struct PokedexListImageView: View {
    @StateObject var viewModel: PokedexListImageViewModel
    var body: some View {
        if let imageURL = URL(string: viewModel.imageURL) {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            Circle()
        }
    }
}

