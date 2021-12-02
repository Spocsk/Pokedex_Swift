//
//  PokedexView.swift
//  PokedexSwift
//
//  Created by Dylan COUTO DE OLIVEIRA on 01/12/2021.
//

import SwiftUI

struct PokedexView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20){
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
