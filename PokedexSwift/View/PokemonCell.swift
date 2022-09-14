//
//  PokemonCell.swift
//  PokedexSwift
//
//  Created by Dylan COUTO DE OLIVEIRA on 01/12/2021.
//

import Kingfisher
import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top)
                    .padding(.leading)
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 10)
                }
            }
        }
        .background(Color(viewModel.backgroundColor(forType: pokemon.type)))
        .cornerRadius(12)
        .shadow(color: Color(viewModel.backgroundColor(forType: pokemon.type)), radius: 3, x: 0.0, y: 0.0)
    }
}
