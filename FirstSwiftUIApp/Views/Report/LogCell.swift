//
//  LogCell.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct LogCell: View {
    var entry: HealthLog
    var body: some View {
        HStack {
            Image("bigHeart")
                .foregroundColor(.red)
                .frame(width: 56, height: 56)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack (spacing: 24) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Pulse")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.neutral3)
                        HStack (alignment: .bottom, spacing: 6) {
                            Text("\(entry.pulse)")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(entry.statusColor)
                            Text("bpm")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(entry.statusColor)
                        }
                    }
                    VStack(alignment: .leading, spacing: 12) {
                        Text("HRV")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.neutral3)
                        HStack (alignment: .bottom, spacing: 4) {
                            Text("\(entry.hrv)")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(entry.statusColor)
                            Text("bpm")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(entry.statusColor)
                        }
                    }
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Status")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.neutral3)
                        
                        Text("\(entry.status)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(entry.statusColor)
                        
                    }
                    
                }
            }
            Spacer()
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(16)
    }
}

