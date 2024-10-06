//
//  CustomTabBar.swift
//  SwiftUICustomTabs
//
//  Created by Manu Aravind on 06/10/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    let tabItems: [TabItem]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: -2)
            
            HStack(spacing: 0) {
                ForEach(0..<tabItems.count, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedTab = index
                        }
                    }) {
                        VStack {
                            Image(systemName: tabItems[index].icon)
                                .font(.system(size: 24))
                                .foregroundColor(selectedTab == index ? .pink : .gray)
                            
                            Text(tabItems[index].title)
                                .font(.caption)
                                .foregroundColor(selectedTab == index ? .pink : .gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                    }
                }
            }
            
            GeometryReader { geometry in
                let tabWidth = geometry.size.width / CGFloat(tabItems.count)
                let indicatorWidth: CGFloat = 40
                let indicatorOffset = (tabWidth * CGFloat(selectedTab)) + (tabWidth - indicatorWidth) / 2
                
                Color.pink
                    .frame(width: indicatorWidth, height: 4)
                    .cornerRadius(2)
                    .offset(x: indicatorOffset)
                    .animation(.easeInOut(duration: 0.3), value: selectedTab)
            }
        }
        .frame(height: 65)
    }
}
