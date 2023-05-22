//
//  PokedexListImageViewModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

class PokedexListImageViewModel: ObservableObject {
    var url: String
    @Published var imageURL = ""
    var service = Service()
    
    init(url: String) {
        self.url = url
        getPokemonDetail(url: self.url)
    }
    func getPokemonDetail(url: String) {
        service.fetchPokemonDetail(url: url) { pokemonDetail in
            self.imageURL = pokemonDetail.front_default
        }
    }
}
