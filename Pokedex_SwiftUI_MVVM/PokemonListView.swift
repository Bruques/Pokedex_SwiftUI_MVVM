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
                ForEach(searchText == "" ? viewModel.pokemons : viewModel.pokemons.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { pokemon in
                    HStack {
                        PokedexListImageView(viewModel: PokedexListImageViewModel(url: pokemon.url))
                        NavigationLink(pokemon.name, destination: Text("Detalhes do pokemon: \(pokemon.name)"))
                    }
                }
                .padding()
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
