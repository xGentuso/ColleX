//
//  Portfolio.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct PortfolioView: View {
    @StateObject private var viewModel = PortfolioViewModel() // Connects to in-memory data manager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                // MARK: - Collection Grid View
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.items) { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                ItemCard(item: item) // Using our reusable ItemCard
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("My Collection")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .overlay(
                // Floating Add Button
                Button(action: {
                    // Handle add item action
                    viewModel.addNewItem(name: "New Card", condition: "Mint", marketValue: 100.0)
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding()
                .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 140) // Floating button position
            )
        }
    }
}

// MARK: - Preview
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
