//
//  InfoCard.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct InfoCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .clipShape(Circle())

            Text(value)
                .font(.headline)
                .bold()
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.secondarySystemBackground)) // Adapts to dark mode
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Preview
struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoCard(title: "Total Value", value: "$3,200", icon: "dollarsign.circle.fill", color: .blue)
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.light)

            InfoCard(title: "Total Value", value: "$3,200", icon: "dollarsign.circle.fill", color: .blue)
                .previewLayout(.sizeThatFits)
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}

