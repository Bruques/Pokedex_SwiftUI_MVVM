//
//  PokemonDetailView.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 13/08/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    init(pokemonEntry: PokemonEntry) {
        self.viewModel = PokemonDetailViewModel(pokemonEntry: pokemonEntry)
    }
    
    var body: some View {
        if let pokemon = viewModel.pokemon {
            VStack {
                AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
                
                Text(viewModel.pokemon?.name ?? "Unknown")
            }
        } else {
            ProgressView()
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemonEntry: PokemonEntry(name: "Bulbassaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
