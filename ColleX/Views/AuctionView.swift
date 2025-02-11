//
//  AuctionView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct AuctionView: View {
    // Sample auction items
    @State private var auctionItems: [Item] = [
        Item(name: "Rare Phoenix Card", condition: "Mint", marketValue: 275.0, acquiredDate: Date().addingTimeInterval(7200)),
        Item(name: "Mystic Dragon Card", condition: "Graded", marketValue: 320.0, acquiredDate: Date().addingTimeInterval(5400))
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                
                // MARK: - Header
                HStack {
                    Text("Live Auctions")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)

                // MARK: - Auction List
                List(auctionItems) { auction in
                    NavigationLink(destination: AuctionDetailView(item: auction)) {
                        HStack(spacing: 12) {
                            // Placeholder Thumbnail
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)

                            VStack(alignment: .leading, spacing: 4) {
                                Text(auction.name)
                                    .font(.headline)
                                    .lineLimit(1)

                                Text("Current Bid: $\(auction.marketValue, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.orange)

                                Text("Ends in: \(formattedTimeLeft(for: auction.acquiredDate))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
        }
    }
    
    // Function to calculate time left (placeholder logic)
    private func formattedTimeLeft(for endDate: Date) -> String {
        let timeLeft = Int(endDate.timeIntervalSinceNow)
        if timeLeft <= 0 { return "Ended" }
        let hours = timeLeft / 3600
        let minutes = (timeLeft % 3600) / 60
        return String(format: "%02d:%02d", hours, minutes)
    }
}

// MARK: - Preview
struct AuctionView_Previews: PreviewProvider {
    static var previews: some View {
        AuctionView()
    }
}
