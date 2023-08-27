import SwiftUI

struct ContactDetail: View {
    let contact: AddressEntry
    
    @ObservedObject var vm = ContactViewModel()
    
    @State private var isFavorited: Bool
    
    @State var showChangeCategoryModal: Bool
    
    @State var contactCategory: AddressCategory
    
    @State var description: String
    
    init(contact: AddressEntry) {
        self.contact = contact
        self.showChangeCategoryModal = false
        self.isFavorited = contact.favourite
        self.description = ""
        self.contactCategory = AddressCategory(id: 1, name: "仕事", userId: 1)
    }
  
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    Section {
                        Group {
                            VStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .foregroundColor(.white)
                                    .padding(30)
                                    .background(Color.yellow)
                                    .clipShape(Circle())
                                
                                // Fullname
                                Text("山田太郎")
                                    .font(.title2)
                                
                                Text(contact.description ?? "")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                                    .padding(.bottom)
                                
                                // Description
                                Text("メモ")
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextEditor(text: $description)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(5)
                                    .frame(height:75)
                                    .lineSpacing(10)
                                    .autocapitalization(.words)
                                    .disableAutocorrection(true)
                                    .padding(.bottom)
                            }
                        }
                        
                        Group {
                            VStack {
                                Text("ナラティブブック")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    Text("NBID").font(.body)
                                    Spacer()
                                    Text("yamada").font(.body)
                                }
                                
                                HStack {
                                    Text("ナラティブブック開く")
                                        .font(.system(size: 12))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                }
                                .onTapGesture {
                                    print("Open NarrativeBook")
                                }
                                .foregroundColor(Color.blue)
                                
                                
                                Divider()
                                
                                HStack {
                                    Text("お気に入り")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .onTapGesture {
                                    isFavorited.toggle()
                                }
                                .foregroundColor(isFavorited ? Color.black:Color.yellow)
                                
                                HStack {
                                    Text("グループ：" + contactCategory.name)
                                    Spacer()
                                    Text("グループを変更")
                                        .onTapGesture {
                                            showChangeCategoryModal = true
                                        }
                                        .font(.system(size: 12))
                                        .padding(5)
                                        .background(Color.secondary)
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }
                    
                    NavigationLink(destination: CreateCall()) {
                        VStack {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.white)
                                .padding(10)
                                .background( Color.green)
                                .clipShape(Circle())
                            
                            // Make call
                            Text("通話開始")
                                .font(.system(size: 12))
                        }
                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                    }
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("連絡先詳細")
                .navigationBarTitleDisplayMode(.inline)
            }
            
            if showChangeCategoryModal {
                ChangeCategoryModal(
                    selected: contactCategory,
                    action: { selected in
                        self.contactCategory = selected
                    },
                    isActive: $showChangeCategoryModal
                )
            }
        }
        .task {
            contactCategory = vm.getContactCategory(id: contact.addressCategoryId)
        }
    }  
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail(contact: AddressEntry(
            id: 2,
            addressCategoryId: 2,
            name: "山田太郎",
            narrativePhoneId: "aasdflj",
            nbAuthorId: nil,
            nbOrganizationId: 1,
            description: "クロースフィールド株式会社　代表",
            iconImagePath: nil,
            favourite: true
        ))
    }
}
