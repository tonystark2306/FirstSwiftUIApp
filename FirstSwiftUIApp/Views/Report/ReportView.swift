//
//  ReportView.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/20/25.
//

import SwiftUI

struct ReportView: View {
    @ObservedObject var data = HealthLogManager()
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.backlground1.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Health Guru")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.neutral111)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    .padding(.bottom, 48)
                
                VStack {
                    Button {
                        isPresented = true
                    } label: {
                        Image("heartButton")
                            .resizable()
                            .frame(width: 263, height: 241)
                    }
                    .sheet(isPresented: $isPresented) {
                        LogInputView(store: data)
                    }
                }
                .padding(.bottom, 64)
                .frame(maxWidth: .infinity)
                
                if data.logData.isEmpty {
                    VStack(spacing: 8) {
                        EmptyCell()
                        
                        VStack (alignment: .leading, spacing: 0) {
                            HStack (alignment: .top, spacing: 0) {
                                Image("smallHeart")
                                    .foregroundColor(.red)
                                Text("Track daily")
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.vertical, 2)
                                    .foregroundStyle(.neutral7)
                                Spacer()
                            }
                            .padding(.horizontal)
                            Text("Click heart icon to log your data")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.neutral22)
                                .padding(.horizontal)
                        }
                        .padding(.vertical, 16)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding()
                        
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(data.logData) { entry in
                                LogCell(entry: entry)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
        }
    }
}


#Preview {
    ReportView()
}



