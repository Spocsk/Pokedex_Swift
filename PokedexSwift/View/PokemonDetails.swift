//
//  PokemonDetails.swift
//  PokedexSwift
//
//  Created by Dylan COUTO DE OLIVEIRA on 21/08/2022.
//

import Foundation
import Kingfisher
import SwiftUI

struct PokemonDetails: View {
    let name: String
    let imageUrl: String

    var body: some View {
        VStack {
            Text(name.capitalized)
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 124, height: 124)
        }
    }
}
