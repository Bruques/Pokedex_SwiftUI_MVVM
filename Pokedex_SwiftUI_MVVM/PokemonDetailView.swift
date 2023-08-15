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
            ZStack {
                VStack(spacing: 0) {
                    ZStack {
                        Color.red
                            .cornerRadius(40)
                            .edgesIgnoringSafeArea(.top)
                        HStack {
                            Text(viewModel.pokemon?.name.capitalized ?? "Unknown")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                            Text("#\(viewModel.getPokemonId())")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                        }
                        .padding(.horizontal)
                    }
                        
                    ZStack {
                        Color.white
                            
                        VStack {
                            HStack {
                                ForEach(pokemon.types, id: \.self) { types in
                                    Text(types)
                                        .foregroundColor(.white)
                                        .bold()
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                        .background(
                                            Capsule()
                                        )
                                }
                            }
                        }
                        
                    }
                }
                AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                } placeholder: {
                    ProgressView()
                }
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
