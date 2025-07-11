import SwiftUI

struct RegisterView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State private var selectedGender = 0
    @State var weight = ""
    @State var height = ""
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        VStack {
            Text("Information")
                .padding(.top, 12)
                .font(.system(size: 20, weight: .bold, design: .default))
            HStack (spacing: 12) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("First name")
                        .font(.system(size: 18))
                        .foregroundColor(Color.black)
                    TextField ("Enter first name", text: $firstName)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Last name")
                        .font(.system(size: 18))
                        .foregroundColor(Color.black)
                    TextField ("Enter last name", text: $lastName)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                }
            }
            .padding(16)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Gender")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Spacer()
                }
                
                Picker("Gender", selection: $selectedGender) {
                    Text("Male").tag(0)
                    Text("Female").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.white)
                .frame(height: 32)
            }
            .padding(16)
            
            HStack (spacing: 12) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Weight")
                        .font(.system(size: 18))
                        .foregroundColor(Color.black)
                    TextField ("kg", text: $weight)
                        .textFieldStyle(CustomTextFieldStyle())
                    
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Height")
                        .font(.system(size: 18))
                        .foregroundColor(Color.black)
                    TextField ("cm", text: $height)
                        .textFieldStyle(CustomTextFieldStyle())
                }
            }
            .padding(16)
            Spacer()
            
            Button(action: {

                dismiss()
            }) {
                Text("Update")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .background(Color(red: 1.0, green: 0.4, blue: 0.4))
                    .cornerRadius(16)
            }
            .padding(16)
            }
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        
        }
    
    }

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.leading, 12)
            .frame(height: 52)
            .background(Color.white)
            .cornerRadius(16)
            .font(.system(size: 16))
    }
}

#Preview {
    RegisterView()
}
