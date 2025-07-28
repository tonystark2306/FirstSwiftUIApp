//
//  FirstSwiftUIAppApp.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/8/25.
//

import SwiftUI

@main
struct FirstSwiftUIAppApp: App {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if hasSeenOnboarding {
                MainTabBar()
            }
            else {
                NavigationStack {
                    FirstOnboardingVC()
                }
            }
        }
    }
}
