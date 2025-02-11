//
//  CommunityView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct CommunityPost: Identifiable {
    let id = UUID()
    let username: String
    let content: String
    let timestamp: String
}

struct CommunityView: View {
    // Dummy community posts
    @State private var posts: [CommunityPost] = [
        CommunityPost(username: "CollectorJoe", content: "Just won an auction for a Mystic Dragon card! #excited", timestamp: "15 min ago"),
        CommunityPost(username: "TradeGuru", content: "Anyone have tips on negotiating trades?", timestamp: "1 hr ago")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List(posts) { post in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            // Profile Picture Placeholder
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 40, height: 40)
                                .overlay(Text(String(post.username.prefix(1))).foregroundColor(.white))
                            
                            VStack(alignment: .leading) {
                                Text(post.username)
                                    .font(.headline)
                                Text(post.timestamp)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        Text(post.content)
                            .font(.body)
                            .padding(.leading, 48)
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Community")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action: New post creation (future feature)
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
