import SwiftUI

struct ImportContacts: View {
    let importTo: AddressCategory
    
    @ObservedObject var vm = ContactViewModel()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                switch vm.state {
                case .idle:
                    Color.clear.onAppear {
                        vm.getContactCategories()
                    }
                case .loading:
                    LoadingView()
                case .success(let contactCategories):
                    VStack {
                        HStack {
                            Image(systemName:"checkmark")
                                .foregroundColor(.green)
                            
                            Text("ナラティブフォン連携済みの表示")
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing).padding()
                          
                        ScrollView {
                            ForEach(contactCategories) { category in
                                Section(
                                    header: VStack(alignment: .leading) {
                                        Text(category.name).colorMultiply(Color.black)
                                        
                                        Divider()
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                    .foregroundColor(.blue)
                                ) {
                                    // TODO: show loading state
                                    ForEach(vm.getByCategory(categoryId: category.id)) { contact in
                                        VStack {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    // For the time being we used favorite property
                                                    // to determine wether the contact in the
                                                    // user's contact list
                                                    Text(contact.name)
                                                        .font( .headline)
                                                        .foregroundColor(contact.favourite ? Color.gray : Color.black)
                                                    
                                                    Text(contact.favourite ? "登録済み" : "未登録")
                                                        .font(.system(size: 12)).foregroundColor(.gray)
                                                }
                                                
                                                Spacer()
                                            }
                                            
                                            Divider()
                                        }
                                        .padding(EdgeInsets(top: 8, leading: 40, bottom: 8, trailing: 20))
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        // Import to group
                        Text("連絡先グループ【\(importTo.name)】へインポート")
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        Button(action: {
                               print("Import")
                           }) {
                               Text("インポート")
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
                           .padding()
                    }
                case .failure(let error):
                    ErrorView(error: error)
                }
            }
            .navigationTitle("連絡先インポート")
        }
    }
}

struct ImportContacts_Previews: PreviewProvider {
    static var previews: some View {
        ImportContacts(importTo: AddressCategory(id: 1, name: "仕事", userId: 1))
    }
}
