
//
//  MainTabBar.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/20/25.
//
import SwiftUI

struct MainTabBar: View {
    @StateObject private var logData = HealthLogManager()
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            ReportView(data: logData)
                .tabItem {
                    Image("reportIcon")
                        .renderingMode(.template)
                    Text("Report")
                }
                .tag(0)
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Image("settingsIcon")
                    .renderingMode(.template)
                Text("Settings")
            }
            .tag(1)
        }
        .accentColor(Color.primary1)
        .navigationBarBackButtonHidden()
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.neutral4)
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
