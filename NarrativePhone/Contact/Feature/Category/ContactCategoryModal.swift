import SwiftUI

struct ContactCategoryModal: View {
    private let service = ContactService()
    
    let title: String
    
    let action: () -> Void
    
    let actionLabel: String
    
    @Binding var isActive: Bool
    
    @Binding var categoryName: String

    @State private var offset: CGFloat = 0
    
    func cancel() {
        offset = 0
        isActive = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    
                    // Group name
                    Label("グループ名", systemImage: "")
                        .labelStyle(.titleOnly)
                        .foregroundColor(.black)
                    
                    TextField("", text: $categoryName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    
                    HStack(spacing:0) {
                        Button {
                            cancel()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.secondary)
                                
                                Text("キャンセル")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                            }
                            .padding(0)
                        }
                        
                        Spacer()
                        
                        Button {
                            action()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.green)
                                
                                Text(actionLabel)
                                    .font(.system(size: 16, weight: .bold))
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
                
            }
            
            .ignoresSafeArea()
            
        }
    }
}

struct ContactCategoryModal_Previews: PreviewProvider {
    static var previews: some View {
        ContactCategoryModal(
            title: "連絡先グループ追加",
            action: {
                
            },
            actionLabel: "追加",
            isActive: .constant(true),
            categoryName: .constant("")
        )
    }
}
