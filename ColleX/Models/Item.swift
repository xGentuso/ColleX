//
//  Item.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: UUID
    var name: String
    var condition: String
    var marketValue: Double
    var acquiredDate: Date
    var category: String? // Optional category (e.g., "Cards", "Figures", "Accessories")
    var imageName: String? // Optional image reference

    init(id: UUID = UUID(), name: String, condition: String, marketValue: Double, acquiredDate: Date, category: String? = nil, imageName: String? = nil) {
        self.id = id
        self.name = name
        self.condition = condition
        self.marketValue = marketValue
        self.acquiredDate = acquiredDate
        self.category = category
        self.imageName = imageName
    }
}

// Sample Items for Testing
extension Item {
    static let sampleItems: [Item] = [
        Item(name: "Phoenix Rising", condition: "Mint", marketValue: 300.0, acquiredDate: Date(), category: "Cards", imageName: "phoenix_card"),
        Item(name: "Dragon Guardian", condition: "Graded", marketValue: 250.0, acquiredDate: Date().addingTimeInterval(-86400), category: "Figures", imageName: "dragon_figure")
    ]
}
