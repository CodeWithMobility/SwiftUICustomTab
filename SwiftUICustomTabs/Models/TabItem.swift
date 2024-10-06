//
//  TabItem.swift
//  SwiftUICustomTabs
//
//  Created by Manu Aravind on 06/10/24.
//

import Foundation

struct TabItem {
    let title: String
    let icon: String
    
    static let allItems: [TabItem] = [
        TabItem(title: "Home", icon: "house"),
        TabItem(title: "Search", icon: "magnifyingglass"),
        TabItem(title: "Notifications", icon: "bell"),
        TabItem(title: "Profile", icon: "person")
    ]
}
