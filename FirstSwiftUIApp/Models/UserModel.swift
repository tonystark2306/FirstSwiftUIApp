//
//  UserModel.swift
//  FirstSwiftUIApp
//
//  Created by iKame Elite Fresher 2025 on 7/28/25.
//

import SwiftUI

class UserProfileModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var weight = ""
    @Published var height = ""
    @Published var selectedGender = 0
    
    var gender: String {
        return selectedGender == 0 ? "Male" : "Female"
    }
    
    var bmi: String {
        guard let weightValue = Double(weight),
              let heightValue = Double(height),
              weightValue > 0, heightValue > 0 else {
            return "0.0"
        }
        let heightConv = heightValue / 100
        let bmiValue = weightValue / (heightConv * heightConv)
        return String(format: "%.1f", bmiValue)
    }
    
    var hasCompleteProfile: Bool {
        return !firstName.isEmpty &&
               !weight.isEmpty &&
               !height.isEmpty
    }
    
    var enabledUpdate: Bool {
        return !firstName.trimmingCharacters(in: .whitespaces).isEmpty &&
               !weight.trimmingCharacters(in: .whitespaces).isEmpty &&
               !height.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
