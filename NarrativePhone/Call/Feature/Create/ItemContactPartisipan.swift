//
//  ItemContactPartisipan.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI

struct ItemContactPartisipan: View {
    let contact : AddressEntry

    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green)
                        .clipShape(Circle())
                    
                    
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .font(.headline)
                            .colorMultiply(Color.black)
                        
                    
                        Text(contact.description ?? "")
                            .font(.system(size: 12))
                            .colorMultiply(.secondary)
                    }
                    
                    Spacer()
                }
                
                Divider().frame(height: 1).padding(0)
            }
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20))
        
    }
}

struct ItemContactPartisipan_Previews: PreviewProvider {
    static var previews: some View {
        ItemContactPartisipan(
            contact: AddressEntry(
                id: 2,
                addressCategoryId: 1,
                name: "山田太郎",
                narrativePhoneId: "aasdflj",
                nbAuthorId: nil,
                nbOrganizationId: 1,
                description: "クロースフィールド株式会社　代表",
                iconImagePath: nil,
                favourite: true
            )
        )
    }
}
