//
//  HomeView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // MARK: - Header
                HStack {
                    Text("ColleX")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)

                    Spacer()
                    
                    Button(action: {
                        // Handle notifications tap
                    }) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
                .padding(.horizontal)

                // MARK: - Quick Action Buttons
                HStack(spacing: 20) {
                    Button(action: {
                        // Navigate to add new item view
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Add Item")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                    Button(action: {
                        // Navigate to import collection view
                    }) {
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                            Text("Import")
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)

                // MARK: - Recent Activity
                VStack(alignment: .leading, spacing: 8) {
                    Text("Recent Activity")
                        .font(.headline)
                        .padding(.horizontal)

                    List {
                        Text("You purchased 'Phoenix Rising' for $120")
                        Text("Auction ended for 'Mystic Dragon' at $250")
                        Text("Added 'Rare Collector’s Edition Card' to your collection")
                    }
                    .listStyle(PlainListStyle())
                    .frame(height: 180) // Limit height to avoid full-page scrolling
                }

                Spacer()
            }
            .padding(.vertical)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Home")
        }
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
