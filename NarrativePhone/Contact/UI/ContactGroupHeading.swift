import SwiftUI

struct ContactGroupHeading: View {
    let category: AddressCategory
    
    let onEditClicked: (_ category: AddressCategory) -> Void
    
    var body: some View {
        HStack {
            Text(category.name)
                .font(.headline)
                .colorMultiply(Color.black)
            
            Spacer()
            
            HStack {
                // Edit category
                Button {
                    onEditClicked(category)
                } label: {
                    Image(systemName: "highlighter")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .padding(5)
                }
                
                // Import contact
                NavigationLink(destination: ImportContacts(importTo: category)) {
                    Image(systemName: "person.line.dotted.person")
                        .resizable()
                        .frame(width: 35, height: 20)
                        .foregroundColor(.blue)
                        .padding(5)
                }
            }
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        .background(Color.gray.opacity(0.2))
    }
}

struct ContactGroupHeading_Previews: PreviewProvider {
    static var previews: some View {
        ContactGroupHeading(
            category: AddressCategory(id: 1, name: "仕事", userId: 1),
            onEditClicked: { category in
                print(category.name)
            }
        )
    }
}
