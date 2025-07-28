//
//  FirstOnboardingVC.swift
//  
//
//  Created by iKame Elite Fresher 2025 on 7/21/25.
//

import SwiftUI

struct FirstOnboardingVC: View {
    @State private var nextScreen: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                VStack (alignment: .center, spacing: 12) {
                    Text("Health Plan Pro")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(.neutral1)
                        .padding(.top, 36)
                    Text("Providing workout routines and health information to support well-being")
                        .padding(.horizontal, 24)
                        .foregroundColor(.neutral3)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 48)
                        .padding(.bottom, 40)
                    Image("phoneImage")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 50)
                    Spacer()
                    Button(action: {
                        nextScreen = true
                    }) {
                        Text("Continue")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.neutral5)
                            .padding()
                            .frame(height: 56)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Color.primary1)
                            .cornerRadius(16)
                            .shadow(radius: 4)
                    }
                    .padding()
                    .navigationDestination(isPresented: $nextScreen) {
                        SecondOnboardingView()
                    }
                }
            }
        }
    }
}

#Preview {
    FirstOnboardingVC()
}
