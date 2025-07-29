//
//  SettingCell.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI
struct SettingCell: View {
    let item: SettingsItem
    let firstCell: Bool
    let lastCell: Bool
    let onlyCell: Bool
    let showSeparator: Bool
    let onTapped: () -> Void
    
    @State private var isPressed = false
    
    var cornerRadius: CGFloat = 12
    
    var body: some View {
        Button(action: onTapped) {
            VStack(spacing: 0) {
                HStack {
                    Image(item.icon)
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                    
                    Text(item.title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color("neutral1"))
                    
                    Spacer()
                    
                    Image("settingChevron")
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .medium))
                        .frame(width: 24, height: 24)
                }
                .padding(.horizontal)
                .frame(height: 52)
                .background(isPressed ? Color(.systemGray6) : Color.white)
                
                if showSeparator {
                    HStack {
                        Color.clear
                            .frame(width: 45)
                        
                        Rectangle()
                            .fill(Color(.accentLine))
                            .frame(height: 1)
                    }
                    .background(Color.white)
                    .padding(.trailing, 16)
                }
            }
        }
        .background(Color.white)
        .cornerRadius(onlyCell ? cornerRadius : (firstCell ? cornerRadius : 0), corners: onlyCell ? .allCorners : (firstCell ? [.topLeft, .topRight] : []))
        .cornerRadius(onlyCell ? 0 : (lastCell ? cornerRadius : 0), corners: onlyCell ? [] : (lastCell ? [.bottomLeft, .bottomRight] : []))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
