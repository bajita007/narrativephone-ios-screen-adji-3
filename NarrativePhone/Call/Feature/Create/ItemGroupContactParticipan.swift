//
//  HeaderItemParticipan.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI

struct ItemGroupContactParticipan: View {
    let category: AddressCategory
    
    var body: some View {
        HStack {
            Text(category.name)
                .font(.headline)
                .colorMultiply(Color.black)
            
            Spacer()
            
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        .background(Color.gray.opacity(0.2))
    }
}

struct ItemGroupContactParticipan_Previews: PreviewProvider {
    static var previews: some View {
        ItemGroupContactParticipan(   category: AddressCategory(id: 1, name: "仕事", userId: 1))
    }
}
