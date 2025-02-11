//
//  PokemonViewModel.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var allCards: [PokemonCard] = []
    @Published var filteredCards: [PokemonCard] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService = PokemonAPIService()

    func loadCards(query: String? = nil) {
        isLoading = true
        errorMessage = nil
        
        apiService.fetchCards(query: query) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let fetchedCards):
                    self.allCards = fetchedCards
                    self.filteredCards = fetchedCards
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func filterCards(searchText: String) {
        if searchText.isEmpty {
            self.filteredCards = allCards
        } else {
            self.filteredCards = allCards.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.set.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
