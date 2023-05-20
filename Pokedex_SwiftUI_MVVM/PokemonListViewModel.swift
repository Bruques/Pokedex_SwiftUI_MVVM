//
//  PokemonListViewModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    var service = Service()
    @Published var pokemons = [PokemonEntry]()
    
    init() {
        fetchPokemonsList()
    }
    
    private func fetchPokemonsList() {
        service.fetchPokemonList { response in
            switch response {
            case .success(let pokemons):
                self.pokemons = pokemons
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
