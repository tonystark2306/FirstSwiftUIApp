import SwiftUI

struct ProfileView: View {
    @State private var firstName = "Mei Channnnn"
    @State private var lastName = ""
    @State private var weight = "48"
    @State private var height = "162"
    @State private var age = "25"
    @State private var gender = "Female"
    @State private var bmi = "18.8"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .frame(width: 108, height: 108)
                        
                        Image("avatarImage")
                            .font(.system(size: 55))
                            .foregroundColor(.white)
                    }
                    
                    Text(firstName)
                        .font(.system(size: 36, weight: .semibold))
                        .foregroundColor(Color.neutral15)
                }
                .padding(.top, 30)
                
                VStack(spacing: 0) {
                    VStack(spacing: 5) {
                        Text("Your BMI:")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.neutral1)
                        
                        Text(bmi)
                            .font(.system(size: 64, weight: .bold))
                            .foregroundColor(Color.good)
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 4)
                    
                    Rectangle()
                        .fill(Color.neutral6)
                        .frame(height: 0.5)
                        .padding(.horizontal, 16)
                    
                    HStack(spacing: -8) {
                        StatView(value: "\(weight) kg", title: "Weight")
                        StatView(value: "\(height) cm", title: "Height")
                        StatView(value: age, title: "Age")
                        StatView(value: gender, title: "Gender")
                    }
                }
                .background(Color.white)
                .cornerRadius(16)
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Spacer()
            }
            .background(Color.background)
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Text("Edit")
                            .foregroundColor(Color("primary2"))
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 32, height: 24)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image("backButton")
                            .font(.system(size: 12, weight: .bold))
                            .frame(width: 24, height: 24)
                          
                    }
                }
            }
        }
    }
}

struct StatView: View {
    let value: String
    let title: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.good)
            
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.neutral3)
        }
        .padding(.top, 12)
        .padding(.bottom, 16)
        .padding(.horizontal, 18)
    }
}
 
#Preview {
    ProfileView()
}
