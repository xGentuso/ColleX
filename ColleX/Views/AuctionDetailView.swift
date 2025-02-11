//
//  AuctionDetailView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct AuctionDetailView: View {
    var item: Item  // Use your Item model for auction details
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Placeholder for the item's image carousel
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
                    .cornerRadius(8)
                Text("Image Carousel")
                    .foregroundColor(.white)
                    .bold()
            }
            
            // Item details
            Text(item.name)
                .font(.largeTitle)
                .bold()
            Text("Condition: \(item.condition)")
                .font(.headline)
            Text("Current Bid: $\(item.marketValue, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.orange)
            
            // Placeholder countdown timer
            Text("Auction ends in: 00:05:23")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            
            // Bid button placeholder
            Button(action: {
                // Action for placing a bid
            }) {
                Text("Place Bid")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationTitle("Auction Details")
    }
}

struct AuctionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AuctionDetailView(item: Item(name: "Rare Phoenix Card", condition: "Mint", marketValue: 275.0, acquiredDate: Date()))
    }
}
