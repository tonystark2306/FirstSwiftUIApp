//
//  SettingsView.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/20/25.
//

import SwiftUI

struct SettingsItem {
    let title: String
    let icon: String
    let iconColor: UIColor = UIColor(named: "primary1") ?? UIColor.systemRed
}

struct SettingsView: View {
    @StateObject private var userProfile = UserProfileModel()
    @State private var goToProfile = false
    @State private var goToRegister = false
    
    let settingsData: [[SettingsItem]] = [
        [
            SettingsItem(title: "Profile", icon: "profile")
        ],
        [
            SettingsItem(title: "Daily Reminder", icon: "dailyReminder"),
            SettingsItem(title: "Change App Icon", icon: "changeAppIcon"),
            SettingsItem(title: "Language", icon: "language")
        ],
        [
            SettingsItem(title: "Rate Us", icon: "rateUs"),
            SettingsItem(title: "Feedback", icon: "feedback"),
            SettingsItem(title: "Privacy Policy", icon: "privacyPolicy"),
            SettingsItem(title: "Term of User", icon: "termOfUser")
        ]
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Settings")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(.neutral1)
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                    
                    VStack(spacing: 16) {
                        PremiumMembershipView()
                        ForEach(0..<settingsData.count, id: \.self) { sectionIndex in
                            SettingSectionView(
                                items: settingsData[sectionIndex],
                                onItemTapped: { title in
                                    onTapped(title)
                                }
                            )
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                }
            }
            .background(Color.background)
            .navigationDestination(isPresented: $goToProfile) {
                ProfileView(userProfile: userProfile, goToRegister: $goToRegister)
            }
            .navigationDestination(isPresented: $goToRegister) {
                RegisterView(userProfile: userProfile)
            }
        }
        .navigationBarHidden(true)
    }
    
    private func onTapped(_ title: String) {
        switch title {
        case "Profile":
            if userProfile.hasCompleteProfile {
                goToProfile = true
            } else {
                goToRegister = true
            }
        default:
            break
        }
    }
}

struct PremiumMembershipView: View {
    var body: some View {
        Button(action: {}) {
            Image("premiumHeader")
                .resizable()
                .padding(.horizontal, 16)
    
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SettingSectionView: View {
    let items: [SettingsItem]
    let onItemTapped: (String) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<items.count, id: \.self) { index in
                let item = items[index]
                let firstCell = index == 0
                let lastCell = index == items.count - 1
                let onlyCell = items.count == 1
                
                SettingCell(
                    item: item,
                    firstCell: firstCell,
                    lastCell: lastCell,
                    onlyCell: onlyCell,
                    showSeparator: !lastCell && !onlyCell,
                    onTapped: {
                        onItemTapped(item.title)
                    }
                )
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SettingsView()
}
