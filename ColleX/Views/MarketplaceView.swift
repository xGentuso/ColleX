//
//  MarketplaceView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct MarketplaceView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String = "All"
    
    // Dummy data for the marketplace
    @State private var listings: [Item] = [
        Item(name: "Mystic Dragon Card", condition: "Graded", marketValue: 250.0, acquiredDate: Date()),
        Item(name: "Phoenix Rising", condition: "Mint", marketValue: 300.0, acquiredDate: Date().addingTimeInterval(-3600)),
        Item(name: "Collector’s Limited Box", condition: "New", marketValue: 150.0, acquiredDate: Date()),
        Item(name: "Rare Signed Card", condition: "Excellent", marketValue: 500.0, acquiredDate: Date())
    ]
    
    var filteredListings: [Item] {
        listings.filter { item in
            (selectedCategory == "All" || itemCategory(item) == selectedCategory) &&
            (searchText.isEmpty || item.name.localizedCaseInsensitiveContains(searchText))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                
                // MARK: - Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search marketplace...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // MARK: - Category Filter Tabs
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(["All", "Cards", "Figures", "Accessories"], id: \.self) { category in
                            Text(category)
                                .font(.subheadline)
                                .bold()
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(selectedCategory == category ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(selectedCategory == category ? .white : .black)
                                .cornerRadius(12)
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // MARK: - Listings Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredListings) { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                ItemCard(item: item)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationTitle("Marketplace")
        }
    }
    
    // Function to categorize items
    private func itemCategory(_ item: Item) -> String {
        if item.name.contains("Card") { return "Cards" }
        if item.name.contains("Box") { return "Accessories" }
        return "Figures"
    }
}

// MARK: - Preview
struct MarketplaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceView()
    }
}
