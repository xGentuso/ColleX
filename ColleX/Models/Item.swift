//
//  Item.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation

struct Item: Identifiable {
    let id: UUID = UUID()
    var name: String
    var condition: String
    var marketValue: Double
    var acquiredDate: Date
}
