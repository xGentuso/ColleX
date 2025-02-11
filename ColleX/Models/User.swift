//
//  User.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let username: String
    let profileImage: String 
    var collection: [String]
    var activeBids: [UUID]

    // Method to add an item to the user's collection
    mutating func addToCollection(itemName: String) {
        collection.append(itemName)
    }

    // Method to track auctions the user is bidding on
    mutating func placeBidOnAuction(auctionID: UUID) {
        if !activeBids.contains(auctionID) {
            activeBids.append(auctionID)
        }
    }
}

// Sample Users (for testing)
extension User {
    static let sampleUsers: [User] = [
        User(username: "CollectorJoe", profileImage: "user1", collection: ["Phoenix Rising", "Mystic Dragon"], activeBids: []),
        User(username: "TradeGuru", profileImage: "user2", collection: ["Rare Collector’s Edition"], activeBids: [])
    ]
}
