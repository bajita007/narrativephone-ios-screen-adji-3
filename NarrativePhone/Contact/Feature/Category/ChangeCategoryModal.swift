import SwiftUI

struct ChangeCategoryModal: View {
    private let service = ContactService()
    
    let selected: AddressCategory
    
    let action: (_ selected: AddressCategory) -> Void
    
    @Binding var isActive: Bool
    
    @State private var categories: [AddressCategory] = []

    @State private var offset: CGFloat = 0
    
    func close() {
        offset = 0
        isActive = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                
                
                VStack(alignment: .leading) {
                    Text("連絡先グループ変更")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    
                    
                    ScrollView {
                        VStack {
                            ForEach(categories) { category in
                                HStack {
                                    Text(category.name)
                                    Spacer()
                                    if selected.id == category.id {
                                        Image(systemName:"checkmark.circle").foregroundColor(.green)
                                    }
                                }.onTapGesture {
                                    action(category)
                                    close()
                                }
                                
                                Divider()
                            }
                        }
                    }
                    .frame(maxHeight: 180)
                    
                    HStack {
                        Button {
                            close()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.secondary)
                                
                                Text("キャンセル")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            }
                            .padding(0)
                        }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 20)
                .padding(30)
                .offset(x: 0, y: offset)
                .onAppear {
                    withAnimation(.spring()) {
                        offset = 0
                    }
                }
            }
            .ignoresSafeArea()
            
        }
        .task {
            self.categories = service.getContactCategories()
        }
    }
}

struct ChangeCategoryModal_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCategoryModal(
            selected: AddressCategory(id: 1, name: "仕事", userId: 1),
            action: { selected in
                print(selected)
            },
            isActive: .constant(true)
        )
    }
}
