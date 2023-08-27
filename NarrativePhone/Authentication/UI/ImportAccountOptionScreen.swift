import SwiftUI

struct ImportAccountOptionScreen: View {
    var body: some View {
        // TODO: center content vertically
        VStack {
            NavigationLink(destination: Login()) {
                Text("ナラティブフォンでログイン")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .cornerRadius(25)
                    .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
            }
            
            Button(action: {
                print("Login with NarrativeBook Account clicked. Open webview")
            }) {
                Text("ナラティブブックでログイン")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            .cornerRadius(25)
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
          
            Spacer()
        }
    }
}

struct ImportAccountOptionScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImportAccountOptionScreen()
    }
}
