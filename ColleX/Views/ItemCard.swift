//
//  ItemCard.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct ItemCard: View {
    var item: Item

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Load image from URL
            if let imageUrl = item.imageName, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 120)
                        .overlay(
                            Text("Loading...")
                                .foregroundColor(.white)
                                .bold()
                        )
                }
                .cornerRadius(8)
            } else {
                // Placeholder for missing image
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 120)
                    .overlay(
                        Text("No Image")
                            .foregroundColor(.white)
                            .bold()
                    )
                    .cornerRadius(8)
            }

            // Item details
            Text(item.name)
                .font(.headline)
                .lineLimit(1)
            HStack {
                Text("Condition: \(item.condition)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text("$\(item.marketValue, specifier: "%.2f")")
                    .font(.subheadline)
                    .bold()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}


// MARK: - Preview
struct ItemCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemCard(item: Item(name: "Dragon Guardian", condition: "Mint", marketValue: 230.0, acquiredDate: Date()))
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.light) // Light Mode Preview

            ItemCard(item: Item(name: "Dragon Guardian", condition: "Mint", marketValue: 230.0, acquiredDate: Date()))
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.dark) // Dark Mode Preview
        }
    }
}
