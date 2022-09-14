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
