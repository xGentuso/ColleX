//
//  ProfileView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct ProfileView: View {
    // Dummy user profile data
    let username: String = "PokeRy"
    let bio: String = "Passionate collector and trader of rare cards."
    let collectionCount: Int = 145
    let totalValue: Double = 3200.0

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                // MARK: - Profile Header
                VStack {
                    // Profile Picture Placeholder
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .overlay(Text(String(username.prefix(1))).font(.largeTitle).foregroundColor(.white))
                    
                    Text(username)
                        .font(.title)
                        .bold()
                    Text(bio)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                }
                .padding()

                // MARK: - Stats Section
                HStack {
                    VStack {
                        Text("\(collectionCount)")
                            .font(.title2)
                            .bold()
                        Text("Items")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("$\(totalValue, specifier: "%.2f")")
                            .font(.title2)
                            .bold()
                        Text("Value")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.vertical)

                // MARK: - Activity Feed
                List {
                    Text("You won the auction for Mystic Dragon Card.")
                    Text("Your item 'Phoenix Rising' has been sold.")
                    Text("You posted a new update in Community.")
                }
                .frame(height: 200)
                
                Spacer()
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Navigate to settings
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
