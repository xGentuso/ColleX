//
//  Auction.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import Foundation

struct Auction: Identifiable {
    let id = UUID()
    let itemName: String
    let condition: String
    var currentBid: Double
    let startingBid: Double
    let sellerID: UUID
    var highestBidderID: UUID?
    let auctionEndDate: Date

    // Computed property to check if auction is active
    var isActive: Bool {
        return Date() < auctionEndDate
    }

    // Time remaining until auction ends
    var timeRemaining: String {
        let timeLeft = Int(auctionEndDate.timeIntervalSinceNow)
        if timeLeft <= 0 { return "Ended" }
        let hours = timeLeft / 3600
        let minutes = (timeLeft % 3600) / 60
        return String(format: "%02d:%02d", hours, minutes)
    }

    // Method to place a bid
    mutating func placeBid(bidderID: UUID, amount: Double) -> Bool {
        guard isActive, amount > currentBid else { return false }
        currentBid = amount
        highestBidderID = bidderID
        return true
    }
}

// Sample Auction Data (for testing)
extension Auction {
    static let sampleAuctions: [Auction] = [
        Auction(itemName: "Rare Phoenix Card", condition: "Mint", currentBid: 275.0, startingBid: 250.0, sellerID: UUID(), highestBidderID: nil, auctionEndDate: Date().addingTimeInterval(7200)),
        Auction(itemName: "Mystic Dragon Card", condition: "Graded", currentBid: 320.0, startingBid: 300.0, sellerID: UUID(), highestBidderID: nil, auctionEndDate: Date().addingTimeInterval(5400))
    ]
}
