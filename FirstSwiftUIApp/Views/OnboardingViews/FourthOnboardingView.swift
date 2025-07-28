//
//  SecondOnboardingView.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct FourthOnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    let items: [String] = [
        ("educationalPlan"),
        ("exercisePlan"),
        ("healthTests"),
    ]
    
    let titles: [String] = [
        ("Educational Plan"),
        ("Exercise Plan"),
        ("Health Tests"),
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedItems: Set<Int> = []
    
    @State private var nextScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea(edges: .all)
            VStack (spacing: 24) {
                Text("What type of plan would you like to follow?")
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.neutral1)
                    .padding(.top, 36)
                    .padding(.leading, 32)
                    .padding(.trailing, 32)
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(0..<items.count, id: \.self) { index in
                        OnboardingCell(
                            imageName: items[index],
                            title: titles[index],
                            isSelected: selectedItems.contains(index)
                        )
                        .onTapGesture {
                            if selectedItems.contains(index) {
                                selectedItems.remove(index)
                            } else {
                                selectedItems.insert(index)
                            }
                        }
                    }
                }
                .padding()
                Spacer()
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        nextScreen = true
                    }
                    hasSeenOnboarding = true
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.neutral5)
                        .padding()
                        .frame(height: 56)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(selectedItems.isEmpty ? Color.neutral3 : Color.primary1)
                        .cornerRadius(16)
                    
                }
                .disabled(selectedItems.isEmpty)
                .padding()
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $nextScreen) {
            MainTabBar()
        }
    }
}
