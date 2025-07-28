//
//  RegisterView.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/20/25.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var userProfile: UserProfileModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HStack (spacing: 12) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("First name")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.neutral15)
                        TextField("Enter first name...", text: $userProfile.firstName)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Last name")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.neutral15)
                        TextField("Enter last name...", text: $userProfile.lastName)
                            .textFieldStyle(CustomTextFieldStyle())
                    }
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("Gender")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.neutral15)
                        Spacer()
                    }
                    
                    Picker("Gender", selection: $userProfile.selectedGender) {
                        Text("Male").tag(0)
                        Text("Female").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(height: 32)
                }
                .padding(.top, 21)
                .padding(.horizontal, 16)
                
                HStack (spacing: 12) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Weight")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.neutral15)
                        TextField("Enter weight...", text: $userProfile.weight)
                            .textFieldStyle(CustomTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Height")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color.neutral15)
                        TextField("Enter height...", text: $userProfile.height)
                            .textFieldStyle(CustomTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                }
                .padding(.top, 21)
                .padding(.horizontal, 16)
                
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Update")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(userProfile.enabledUpdate ? Color.primary1 : Color.neutral3)
                        .cornerRadius(16)
                }
                .disabled(!userProfile.enabledUpdate)
                .padding(16)
            }
            .background(Color.background)
            .navigationTitle("Information")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("backButton")
                            .font(.system(size: 12, weight: .bold))
                            .frame(width: 24, height: 24)
                          
                    }
                }
            }
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 12)
            .frame(height: 52)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.neutral4, lineWidth: 1)
            )
            .cornerRadius(16)
            .font(.system(size: 16, weight: .regular))
    }
}

#Preview {
    RegisterView(userProfile: UserProfileModel())
}
