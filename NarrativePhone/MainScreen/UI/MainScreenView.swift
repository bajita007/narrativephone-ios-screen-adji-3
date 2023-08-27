import SwiftUI

struct MainScreenView: View {
    @ObservedObject private var selectedTab = SelectedTab()
    @State private var showNavigationBar = true
    
    @State var selection: Int = 1
    var title = ["ユーザ切り替え", "お気に入り", "連絡先", "a", "a"]
    var showTabBar: Bool = false
    var body: some View {
        
        TabView (selection: $selectedTab.itemSelected) {
            Spacer().tabItem {
                Image(systemName: "person.circle")
                Text("ユーザー")
            }
            .tag(0)
            .alert("ユーザ切り替え", isPresented: $selectedTab.isCustomItemSelected, actions: {
                Button("山田太郎", action: {})
                Button("山田二郎", action: {})
                Button("キャンセル", role: .cancel, action: {})
                
            }, message: {
                Text("ユーザ切り替え")
            }
                   
            )
            
            
            FavoriteContactList()
                .tabItem {
                    Image(systemName: "star")
                    Text("お気に入り")
                }
                .tag(1)
            
            
            ContactList()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("連絡先")
                }.tag(2)
            
            
            
            CallHistoryList()
                .tabItem {
                    Image(systemName: "clock")
                    Text("履歴")
                }
                .tag(3)
            
            
            
            
            AccountSettings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }
                .tag(4)
            
        }
    }
}



struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
