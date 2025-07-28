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
                    .foregroundStyle(.neutral1)
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
                
                if data.entries.isEmpty {
                    VStack(spacing: 8) {
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
                        
                        VStack (alignment: .leading) {
                            HStack (alignment: .center) {
                                Image("smallHeart")
                                    .foregroundColor(.red)
                                Text("Track daily")
                                    .font(.system(size: 16, weight: .semibold))
                                    .padding(.vertical, 4)
                                Spacer()
                            }
                            .padding(.horizontal)
                            Text("Click heart icon to log your data")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.neutral22)
                                .padding(.horizontal)
                        }
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding()
                        
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(data.entries) { entry in
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
