//
//  PokemonDetailViewModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 14/08/23.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    var pokemonEntry: PokemonEntry
    @Published var pokemon: Pokemon?
    init(pokemonEntry: PokemonEntry) {
        self.pokemonEntry = pokemonEntry
        self.getPokemonDetail()
    }
    
    private func getPokemonDetail() {
        guard let urlString = pokemonEntry.url, let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data, let pokemon = try? JSONDecoder().decode(PokemonDetails.self, from: data) {
                let newPokemon = Pokemon(name: pokemon.name ?? "Unknown",
                                         height: pokemon.height ?? 0,
                                         weight: pokemon.weight ?? 0,
                                         imageUrl: pokemon.sprites?.front_default ?? "",
                                         types: pokemon.types?.compactMap { $0.type?.name } ?? [])
                
                DispatchQueue.main.async {
                    self.pokemon = newPokemon
                }
            }
        }.resume()
    }
    
}
