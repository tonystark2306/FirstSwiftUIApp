//
//  SecondOnboardingView.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct SecondOnboardingView: View {
    
    let items: [String] = [
        ("heartRate"),
        ("highBloodPressure"),
        ("stressAndAnxiety"),
        ("lowEnergyLevels")
    ]
    
    let titles: [String] = [
        ("Heart Rate"),
        ("High Blood Pressure"),
        ("Stress & Anxiety"),
        ("Low Energy Levels")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var selectedItems: Set<Int> = []
    
    @State private var nextScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.onboardBg.ignoresSafeArea(edges: .all)
            VStack (spacing: 24) {
                Text("Which heart health issue concerns you the most?")
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(.neutral11)
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
            ThirdOnboardingView()
        }
    }
}


#Preview {
    SecondOnboardingView()
}
