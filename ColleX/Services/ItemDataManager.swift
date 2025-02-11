//
//  ItemDataManager.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation
import Combine

final class ItemDataManager: ObservableObject {
    static let shared = ItemDataManager() // Singleton instance
    
    @Published var items: [Item] = []
    
    private init() {
        // Optionally, load some mock data for testing
        items = [
            Item(name: "Dragon Guardian - Limited Edition", condition: "Mint", marketValue: 230.0, acquiredDate: Date()),
            Item(name: "Mystic Phoenix Card", condition: "Graded", marketValue: 150.0, acquiredDate: Date().addingTimeInterval(-86400))
        ]
    }
    
    func addItem(_ item: Item) {
        items.append(item)
    }
    
    func updateItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item
        }
    }
    
    // You can add more functions as needed (delete, filter, etc.)
}
