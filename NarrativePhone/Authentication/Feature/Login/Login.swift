import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var pass: String = ""
    
    var body: some View {
        VStack {
            // Logo goes here
            
            Text("ログイン")
                .font(.system(size: 20))
                .padding(.top)
            

            VStack(alignment: .leading) {
                // Email address
                Group {
                    Label("メールアドレス", systemImage: "")
                        .labelStyle(.titleOnly)
                        .foregroundColor(.black)
                    
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                
                // Password
                Group {
                    Label("パスワード", systemImage: "")
                        .labelStyle(.titleOnly)
                        .foregroundColor(.black)
                    
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
            }.padding()
            
            Button(action: {
                print("Perform login sequence")
            }) {
                Text("ログイン")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.green, lineWidth: 2)
                    )
                    .background(.green)
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
            }
          
            Spacer()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
