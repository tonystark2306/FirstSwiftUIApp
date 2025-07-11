import SwiftUI

struct EmptyProfileListView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                VStack(spacing: 20) {

                    Image("giftBox")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 128, height: 128)
                        .foregroundColor(.gray)
                    
 
                    VStack(spacing: 8) {
                        Text("Empty folder, Tap ")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        +
                        Text("\"Add Profile\"\n")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.red)
                        +
                        Text("button to create profile now.")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                }
                
                .padding(20)
                

                Button(action: {

                    print("tapped")
                }) {
                    Text("Add Profile")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(width: 162, height: 52)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.redButton)
                        )
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 80)
            }
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
    }
}

#Preview {
    EmptyProfileListView()
}
