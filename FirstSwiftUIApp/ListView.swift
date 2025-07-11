import SwiftUI

struct ProfileListView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("M")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                VStack (spacing: 12) {
                    ProfileCell(
                        name: "Mei Chan",
                        weight: "48kg",
                        height: "162cm",
                    )
                    
                    ProfileCell(
                        name: "Khánh Vy",
                        weight: "51kg",
                        height: "165cm",
                    )
                    
                    ProfileCell(
                        name: "Thanh Thuỷ",
                        weight: "55kg",
                        height: "175cm",
                    )
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
                Spacer()
            }
            .background(Color.gray.opacity(0.15))
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .bold))
                            .frame(width: 20, height: 20)
                            .background(Circle().fill(Color.red))
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

struct ProfileCell: View {
    let name: String
    let weight: String
    let height: String

    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "person.fill")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .frame(width: 44, height: 44)
                .background(Circle().fill(Color.blue))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                
                Text("W: \(weight)  -  H: \(height)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .font(.system(size: 10, weight: .bold))
                    .frame(width: 20, height: 20)
                    .background(Circle().fill(Color.customGray))
          
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
        )
    }
}

#Preview {
    ProfileListView()
}
