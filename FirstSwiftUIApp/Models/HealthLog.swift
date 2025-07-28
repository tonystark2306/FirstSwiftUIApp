//
//  HealthLog.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

struct HealthLog: Identifiable {
    let id = UUID()
    let pulse: Int
    let hrv: Int
    let date = Date()
    
    var status: String {
        if pulse >= 60 && pulse <= 100 {
            return "Good"
        } else if pulse < 60 {
            return "Low"
        } else {
            return "Warning"
        }
    }
    
    var statusColor: Color {
        switch status {
        case "Good": return .good
        case "Low": return .low
        case "Warning": return .warning
        default: return .gray
        }
    }
}

class HealthLogManager: ObservableObject {
    @Published var entries: [HealthLog] = []
    
    func add(pulse: Int, hrv: Int) {
        entries.insert(HealthLog(pulse: pulse, hrv: hrv), at: 0)
    }
}
