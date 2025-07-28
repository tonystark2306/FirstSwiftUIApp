//
//  LogInputView.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/25/25.
//

import SwiftUI

struct LogInputView: View {
    @ObservedObject var store: HealthLogManager
    @State var pulse = ""
    @State var hrv = ""
    @Environment(\.dismiss) var dismiss
    
    var isValid: Bool {
        Int(pulse) != nil && Int(hrv) != nil && !pulse.isEmpty && !hrv.isEmpty
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Pulse")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.neutral15)
                            TextField("Enter your pulse", text: $pulse)
                                .textFieldStyle(CustomTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("HRV")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.neutral15)
                            TextField("Enter your HRV", text: $hrv)
                                .textFieldStyle(CustomTextFieldStyle())
                                .keyboardType(.numberPad)
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        if let p = Int(pulse), let h = Int(hrv) {
                            store.add(pulse: p, hrv: h)
                            dismiss()
                        }
                    } label: {
                        Text("Add")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.neutral5)
                            .frame(height: 56)
                            .frame(maxWidth: .infinity)
                            .background(isValid ? Color.primary1 : Color.neutral3)
                            .cornerRadius(16)
                    }
                    .disabled(!isValid)
                    .padding()
                }
                .navigationTitle("Information")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("closeButton")
                                .frame(width: 24, height: 24)
                        }
                    }
                }
            }
        }
    }
}

