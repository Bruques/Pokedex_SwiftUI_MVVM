//
//  PokemonListImageView.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import SwiftUI

struct PokemonListImageView: View {
    @StateObject var viewModel: PokemonListImageViewModel
    var body: some View {
        AsyncImage(url: URL(string: self.viewModel.imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}
