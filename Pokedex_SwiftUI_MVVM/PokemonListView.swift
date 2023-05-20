//
//  ContentView.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel
    @State var searchText = ""
    var body: some View {
        NavigationView {
            List {
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(viewModel: PokemonListViewModel())
    }
}
