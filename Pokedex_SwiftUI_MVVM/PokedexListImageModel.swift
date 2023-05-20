//
//  PokedexListImageModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

struct PokedexListImageModel: Codable {
    let sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    let front_default: String
}
