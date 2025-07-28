//
//  OnboardingCell.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/25/25.
//

import SwiftUI

struct OnboardingCell: View {
    var imageName: String
    var title: String
    var isSelected: Bool = false
    var spacing: CGFloat = 18
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Image(isSelected ? "selectedBox" : "unselectedBox")
                    .frame(width: 18, height: 18, alignment: .center)
                Spacer()
            }
            .padding()
            VStack (alignment: .center) {
                Image(imageName)
                    .frame(width: 64, height: 64)
            }
            .frame(maxWidth: .infinity)
            Spacer()
            Text(title)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(Color.neutral2)
                .lineSpacing(4)
                .padding()
        }
        .frame(width: (screenWidth - 3 * spacing) / 2, height: 210)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.primary1 : Color.clear, lineWidth: 1.5)
        )
    }
}

