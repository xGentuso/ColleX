//
//  ItemDetailView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct ItemDetailView: View {
    var item: Item  // Use your Item model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Image carousel placeholder
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 200)
                    .cornerRadius(8)
                Text("Image Carousel")
                    .foregroundColor(.white)
                    .bold()
            }
            
            Text(item.name)
                .font(.largeTitle)
                .bold()
            Text("Condition: \(item.condition)")
                .font(.headline)
            Text("Market Value: $\(item.marketValue, specifier: "%.2f")")
                .font(.title2)
                .foregroundColor(.green)
            
            // Detailed description placeholder
            Text("Description: This is a detailed description of the item. It might include provenance, rarity, and other pertinent details about the collectible.")
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Item Details")
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(name: "Dragon Guardian", condition: "Mint", marketValue: 230.0, acquiredDate: Date()))
    }
}
