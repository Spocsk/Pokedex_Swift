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

    @State var searchText = ""
    @State private var showSheet: Bool = false

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(viewModel.filterPokemon(pokemonName: searchText)) { pokemon in
                        PokemonCell(pokemon: pokemon, viewModel: viewModel).onTapGesture {
                            showSheet.toggle()
                        }
                        .sheet(isPresented: $showSheet) {
                            PokemonDetails(name: pokemon.name, imageUrl: pokemon.imageUrl).presentationDetents([.medium])
                        }
                    }
                }
                Text("")
                    .searchable(text: $searchText)
                    .onSubmit(of: .search) {
                        viewModel.filterPokemon(pokemonName: searchText)
                    }
                    .navigationTitle("Pokedex")
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
