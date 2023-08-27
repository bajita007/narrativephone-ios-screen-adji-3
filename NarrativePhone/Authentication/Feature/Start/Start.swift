import SwiftUI

struct Start: View {
    var body: some View {
        NavigationView {
            // TODO: center content vertically
            VStack {
                // TODO: add logo here
                
                Button(action: {
                    print("Register clicked. Open webview")
                }) {
                    Text("新規アカウント作成")
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
                
                Button(action: {
                    print("Login with NarrativeBook Account clicked. Open webview")
                }) {
                    Text("ナラティブブック連携")
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
                
                NavigationLink(destination: ImportAccountOptionScreen()) {
                    Text("既存アカウントのインポート")
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
                
                Spacer()
            }
        }
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
