//
//  ContentView.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(getResearchPokemons()) { pokemon in
                    listItem(pokemon)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

extension PokemonListView {
    func listItem(_ pokemon: PokemonEntry) -> some View {
        NavigationLink {
            PokemonDetailView(pokemonEntry: pokemon)
        } label: {
            HStack {
                PokemonListImageView(viewModel: PokemonListImageViewModel(url: pokemon.url ?? ""))
                    .frame(width: 100, height: 100)
                Text(pokemon.name?.capitalized ?? "Unknown")
                Spacer()
            }
        }
        
    }
    
    func getResearchPokemons() -> [PokemonEntry] {
        return searchText == "" ? viewModel.pokemons : viewModel.pokemons.filter({ pokemon in
            guard let pokemonName = pokemon.name else { return false }
            return pokemonName.contains(searchText.lowercased())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
