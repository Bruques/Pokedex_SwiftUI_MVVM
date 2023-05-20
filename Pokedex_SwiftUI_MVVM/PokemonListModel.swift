//
//  PokemonListModel.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

struct PokemonListModel: Codable {
    let results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    var id = UUID()
    let name: String
    let url: String
}
