//
//  PokedexListImageViewModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

class PokedexListImageViewModel: ObservableObject {
    var service = Service()
    func getPokemonDetail(url: String) {
        service.fetchPokemonDetail(url: url) { pokemonDetail in
            print(pokemonDetail.front_default)
        }
    }
}
