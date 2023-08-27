//
//  ShowModalTabBarItem.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI

public struct ShowModalTabBarItem: View {
    var radius: CGFloat = 50
    let action: () -> Void

    public init( action: @escaping () -> Void) {
        
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing:0) {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .frame(width: 50, height: 40, alignment: .center)
               
                .foregroundColor(Color( .gray))
          
            Text("ユーザー")
                .font(.system(size: 10))
                .foregroundColor(Color(.gray))
                .padding(0)
        }
        .frame( height: 60)
        .onTapGesture(perform: action)
    }
}

struct ShowModalTabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        ShowModalTabBarItem() { }
    }
}
