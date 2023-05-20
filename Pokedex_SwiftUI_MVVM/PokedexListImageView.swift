//
//  PokedexListImageView.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import SwiftUI

struct PokedexListImageView: View {
    @StateObject var viewModel = PokedexListImageViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear() {
                viewModel.getPokemonDetail(url: "https://pokeapi.co/api/v2/pokemon/1/")
            }
    }
}

struct PokedexListImageView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexListImageView()
    }
}
