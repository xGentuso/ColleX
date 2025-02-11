//
//  MainTabView.swift
//  ColleX
//
//  Created by ryan mota on 2025-02-10.
//

import SwiftUI

struct MainTabView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            PortfolioView()
                .tabItem {
                    Image(systemName: "folder.fill")
                    Text("Portfolio")
                }

            MarketplaceView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Marketplace")
                }

            AuctionView()
                .tabItem {
                    Image(systemName: "gavel.fill")
                    Text("Auctions")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(.blue) // Keeps color consistent
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainTabView()
                .preferredColorScheme(.light) // Light Mode Preview
            
            MainTabView()
                .preferredColorScheme(.dark) // Dark Mode Preview
        }
    }
}
