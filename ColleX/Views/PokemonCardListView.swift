//
//  PokemonCardListView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct PokemonCardListView: View {
    @StateObject private var viewModel = PokemonViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search Pokémon or Set...", text: $searchText, onEditingChanged: { _ in
                        viewModel.filterCards(searchText: searchText)
                    })
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                .padding(.horizontal)

                if viewModel.isLoading {
                    ProgressView("Loading Pokémon Cards...")
                        .padding()
                } else if viewModel.filteredCards.isEmpty {
                    Text("No Pokémon cards found.")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    // MARK: - Card Grid View
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(viewModel.filteredCards) { card in
                                PokemonCardView(card: card)
                            }
                        }
                        .padding()
                    }
                    .refreshable {
                        viewModel.loadCards()
                    }
                }
            }
            .navigationTitle("Pokémon Cards")
            .onAppear {
                viewModel.loadCards()
            }
        }
    }
}

// MARK: - Card UI Component
struct PokemonCardView: View {
    let card: PokemonCard

    var body: some View {
        VStack {
            if let imageUrl = card.images?.large {
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 180)
                .cornerRadius(8)
            }

            Text(card.name)
                .font(.headline)
                .foregroundColor(.primary)

            Text(card.set.name)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Preview
struct PokemonCardListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardListView()
    }
}
