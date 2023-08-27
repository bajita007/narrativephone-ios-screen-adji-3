import SwiftUI

struct FavoriteContactList: View {
    @ObservedObject var vm = FavoriteContactViewModel()
    
    
    var body: some View {

            GeometryReader { _ in
                switch vm.state {
                case .idle:
                    Color.clear.onAppear {
                        vm.getAll()
                    }
                case .loading:
                    LoadingView()
                case .success(let items):
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(items) { item in
                                FavoriteContactListItem(contact: item)
                            }
                        }
                    }
                case .failure(let error):
                    ErrorView(error: error)
                }
            }

            .navigationTitle("お気に入り")
    }
}



struct FavoriteContactList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteContactList()
    }
}
