//
//  MainTabBar.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/20/25.
//
import SwiftUI

struct MainTabBar: View {
    @State private var selectedTab = 0
    @StateObject private var logData = HealthLogManager()
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0:
                    ReportView(data: logData)
                case 1:
                    NavigationView {
                        SettingsView()
                    }
                default:
                    ReportView(data: logData)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(spacing: 0) {
                Spacer(minLength: 0)
                
                HStack(spacing: 140) {
                    tabBarItem(index: 0, imageName: "reportIcon", label: "Report")
                    tabBarItem(index: 1, imageName: "settingsIcon", label: "Settings")
                }
                .frame(height: 50)
                .padding(.top, 8)
                .padding(.bottom, 26)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: -4)
                )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden()
    }

    func tabBarItem(index: Int, imageName: String, label: String) -> some View {
        VStack(spacing: 4) {
            Image(imageName)
                .renderingMode(.template)
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(selectedTab == index ? Color.primary1 : Color.neutral4)
            
            Text(label)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(selectedTab == index ? Color.primary1 : Color.neutral4)
        }
        .onTapGesture {
            selectedTab = index
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    MainTabBar()
}
