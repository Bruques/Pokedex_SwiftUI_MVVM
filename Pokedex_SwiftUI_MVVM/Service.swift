//
//  Service.swift
//  Pokedex_SwiftUI_MVVM
//
//  Created by Bruno Marques on 20/05/23.
//

import Foundation

enum ServiceError: Error {
    case requestError
    case dataError
    case decodeError
}

class Service {
    func fetchPokemonList(completion: @escaping (Result<[PokemonEntry], Error>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(Result.failure(ServiceError.requestError))
            }
            
            guard let safeData = data else {
                completion(Result.failure(ServiceError.dataError))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(PokemonListModel.self, from: safeData)
                completion(Result.success(decodedData.results))
            } catch {
                completion(Result.failure(ServiceError.decodeError))
            }
        }
        task.resume()
    }
    
    func fetchPokemonDetail(url: String, completion: @escaping (PokemonSprites) -> Void) {
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(PokedexListImageModel.self, from: safeData)
                completion(decodedData.sprites)
            } catch {
                print(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
}
