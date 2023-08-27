import SwiftUI

struct EditAccount: View {
    let account: User
    
    @ObservedObject var vm = AccountViewModel()
    
    @State private var accountName: String
    
    @State private var loginId: String
    
    @State private var name: String
    
    @State private var description: String
    
    @State private var email: String
    
    init(account: User) {
        self.account = account
        accountName = account.accountName
        loginId = ""
        name = account.name
        description = account.description ?? ""
        email = account.email
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Label("アカウント識別名", systemImage: "")
                            .labelStyle(.titleOnly)
                            .foregroundColor(.black)
                        
                        TextField("", text: $accountName)
                            .textFieldStyle(.roundedBorder)
                        
                        Spacer().frame(height: 20)
                    }
                    
                    Group {
                        Label("ログインID：サーバーにログインするために利用します", systemImage: "")
                            .labelStyle(.titleOnly)
                            .foregroundColor(.black)
                        
                        TextField("", text: $loginId)
                            .textFieldStyle(.roundedBorder)
                        
                        Text("半角英数字及び[＠.-()]のみで６文字以上")
                            .font(.system(size: 12))
                        
                        Spacer().frame(height: 20)
                    }
                    
                    Group {
                        Label("表示名：通話先に表示される名前です", systemImage: "")
                            .labelStyle(.titleOnly)
                            .foregroundColor(.black)
                        
                        TextField("", text: $name)
                            .textFieldStyle(.roundedBorder)
                        
                        Spacer().frame(height: 20)
                    }
                    
                    Group {
                        Label("説明：通話先に表示されます", systemImage: "")
                            .labelStyle(.titleOnly)
                            .foregroundColor(.black)

                        VStack {
                           TextEditor(text: $description)
                             .frame(height:120, alignment: .center)
                             .lineSpacing(10)
                             .autocapitalization(.words)
                             .disableAutocorrection(true)
                        }
                        .overlay(
                             RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        
                        Spacer().frame(height: 20)
                    }
                    
                    Group {
                        Label("メールアドレス(メール確認が終わるまで変更されません)", systemImage: "")
                            .labelStyle(.titleOnly)
                            .foregroundColor(.black)
                        
                        TextField("", text: $email)
                            .textFieldStyle(.roundedBorder)
                        
                        Spacer().frame(height: 20)
                    }
                     
                    Button(action: {
                        vm.updateAccount()
                    }) {
                        Text("変更")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .background(Color.green)
                    .cornerRadius(25)
                }
                .padding(20)
            }
            
            if(vm.showLoadingModal){
                LoadingModal()
            }
        }
        .navigationTitle("アカウント情報編集")
    }
}

struct EditAccount_Previews: PreviewProvider {
    static var previews: some View {
        EditAccount(
            account: User(
                id: 1,
                name: "山田太郎",
                accountName: "yamada",
                email: "yamada@example.co.jp",
                nbId: "narrative-book-user",
                nbAuthorId:nil,
                nbOrganizationId: nil,
                narrativePhoneId: "yamada",
                zoomUserId: "yamadataro",
                zoomUserLastName: "山田",
                zoomUserFirstName: "太郎",
                zoomUserEmail: "yamada@example.co.jp",
                description: "クロースフィールド株式会社　代表",
                iconImg:nil,
                state: 1
            )
        )
    }
}
