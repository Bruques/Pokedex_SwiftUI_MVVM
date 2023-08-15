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
    let name: String?
    let url: String?
    var id: UUID {
       UUID()
    }
}

struct PokemonDetails: Codable {
    let name: String?
    let id: Int?
    let height, weight: Double?
    let sprites: PokemonDetailsSprites?
    let types: [PokemonDetailsTypes]?
}

struct PokemonDetailsSprites: Codable {
    let front_default: String?
}

struct PokemonDetailsTypes: Codable {
    let type: PokemonDetailsTypesType?
}

struct PokemonDetailsTypesType: Codable {
    let name: String?
}

struct Pokemon {
    let name: String
    let height, weight: Double
    let imageUrl: String
    let types: [String]
    let id: Int
}
