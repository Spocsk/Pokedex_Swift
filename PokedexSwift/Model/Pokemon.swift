//
//  Pokemon.swift
//  PokedexSwift
//
//  Created by Dylan COUTO DE OLIVEIRA on 01/12/2021.
//

import Foundation

struct Pokemon: Identifiable, Decodable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}


let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbizzar", imageUrl: "1", type: "poison"),
    .init(id: 1, name: "Banane", imageUrl: "1", type: "poison"),
    .init(id: 2, name: "Bulbizzar", imageUrl: "1", type: "poison"),
    .init(id: 3, name: "Bulbizzar", imageUrl: "1", type: "poison"),
    .init(id: 4, name: "Bulbizzar", imageUrl: "1", type: "poison"),

]

