//
//  PokemonListViewModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    var service = Service()
    
    init() {
        self.fetchPokemonsList()
    }
    
    private func fetchPokemonsList() {
        
    }
}
