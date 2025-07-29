//
//  EmptyCell.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/29/25.
//

import SwiftUI

struct EmptyCell: View {
    var body: some View {
        HStack {
            Image("bigHeart")
                .foregroundColor(.gray)
                .frame(width: 56, height: 56)
                .padding(12)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Pulse")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.neutral3)
                        HStack (alignment: .center, spacing: 4) {
                            Text("--")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.neutral22)
                            Text("bpm")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.neutral22)
                        }
                        
                    }
                    .padding(.trailing, 24)
                    VStack (alignment: .leading, spacing: 12) {
                        Text("HRV")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.neutral3)
                        HStack (alignment: .center, spacing: 4) {
                            Text("--")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.neutral22)
                            Text("bpm")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.neutral22)
                        }
                        
                    }
                    .padding(.trailing, 24)
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Status")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.neutral3)
                        HStack (alignment: .center, spacing: 4) {
                            Text("--")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.neutral22)
                            Text("bpm")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.neutral22)
                        }
                        
                    }
                }
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    EmptyCell()
}
