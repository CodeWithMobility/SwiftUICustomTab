//
//  ContentView.swift
//  SwiftUICustomTabs
//
//  Created by Manu Aravind on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        let tabItems = TabItem.allItems
        
        VStack {
            // Main content view based on selected tab
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: SearchView()
                case 2: NotificationsView()
                default: ProfileView()
                }
            }
            
            // Custom Tab Bar
            CustomTabBar(selectedTab: $selectedTab, tabItems: tabItems)
                .frame(height: 65)
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
//                .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: -2)
        }
        .background(Color.tabBackground(for: selectedTab))
        .padding(.bottom, 35)
        .edgesIgnoringSafeArea(.bottom)
    }
}

extension Color {
    static func tabBackground(for index: Int) -> Color {
        switch index {
        case 0: return .orange
        case 1: return .purple
        case 2: return .green
        default: return .blue
        }
    }
}

#Preview {
    ContentView()
}
