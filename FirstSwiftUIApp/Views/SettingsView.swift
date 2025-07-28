import SwiftUI

struct SettingsItem {
    let title: String
    let icon: String
    let iconColor: UIColor = UIColor(named: "primary1") ?? UIColor.systemRed
}

struct SettingsView: View {
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
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Text("Settings")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.neutral1)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    //.frame(maxWidth: .infinity, alignment: .leading)
                
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
        .background(Color("Background"))
        .navigationBarHidden(true)
    }
    
    private func onTapped(_ title: String) {
        switch title {
        case "Profile":
            print("Navigate to Profile")
        default:
            break
        }
    }
}

struct PremiumMembershipView: View {
    var body: some View {
        Button(action: {
            print("Premium membership tapped")
        }) {
            
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
                    onTapped: { onItemTapped(item.title) }
                )
            }
        }
        .padding(.horizontal, 16)
    }
}

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

#Preview {
    SettingsView()
}
