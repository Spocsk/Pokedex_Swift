//
//  PokemonViewModel.swift
//  PokedexSwift
//
//  Created by Dylan COUTO DE OLIVEIRA on 02/12/2021.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
        print(pokemon)
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
            case "fire": return .systemRed
            case "poison": return .systemGreen
            case "water": return .systemTeal
            case "electric": return .systemYellow
            case "psychic": return .systemPurple
            case "normal": return .systemOrange
            case "ground": return .systemGray
            case "flying": return .systemBlue
            case "fairy": return .systemPink
            default: return .systemIndigo
        }
    }
    
    func filterPokemon(pokemonName: String) -> [Pokemon] {
        if pokemonName.isEmpty {
            return pokemon
        } else {
            return pokemon.filter {
                $0.name
                    .localizedCaseInsensitiveContains(pokemonName)
            }
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
