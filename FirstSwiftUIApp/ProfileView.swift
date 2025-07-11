import SwiftUI

struct ProfileView: View {
    @State private var firstName = "Mei Channnn"
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
                            .fill(Color(red: 1.0, green: 0.4, blue: 0.4))
                            .frame(width: 108, height: 108)
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 55))
                            .foregroundColor(.white)
                    }
                    
                    Text(firstName)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(Color(red: 89/255, green: 97/255, blue: 122/255))
                }
                .padding(.top, 30)
                
                VStack(spacing: 0) {
                    VStack(spacing: 5) {
                        Text("Your BMI:")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        Text(bmi)
                            .font(.system(size: 64, weight: .bold))
                            .foregroundColor(Color(red: 43/255, green: 174/255, blue: 32/255))
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 12)
                    
                    Rectangle()
                        .fill(Color(white: 0.9))
                        .frame(height: 1)
                        .padding(.horizontal, 16)
                    
                    HStack(spacing: 0) {
                        StatView(value: "\(weight) kg", title: "Weight")
                        StatView(value: "\(height) cm", title: "Height")
                        StatView(value: age, title: "Age")
                        StatView(value: gender, title: "Gender")
                    }
                }
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 0)
                .padding(.horizontal, 20)
                .padding(.top, 30)
                
                Spacer()
            }
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 13, weight: .bold))
                            .frame(width: 20, height: 20)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.customGray)
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
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color(red: 43/255, green: 174/255, blue: 32/255))
            
            Text(title)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
    }
}

#Preview {
    ProfileView()
}
