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
            // MARK: - Image Section
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.gray.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                    .frame(height: 140)
                    .cornerRadius(8)

                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white.opacity(0.8))
            }

            // MARK: - Item Name
            Text(item.name)
                .font(.headline)
                .foregroundColor(.primary) // Adapts to Light/Dark Mode
                .lineLimit(1)

            // MARK: - Item Details (Condition & Price)
            HStack {
                Text(item.condition)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(6)

                Spacer()

                Text("$\(item.marketValue, specifier: "%.2f")")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground)) // Dark Mode Adaptive Background
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 0, y: 4)
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
