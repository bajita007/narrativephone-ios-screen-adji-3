//
//  TabBarItem.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI
enum Tab {
    case favorite
    case contact
    case callHistory
    case settings
}

struct TabBarItem: View {
    @Binding var currentView: Tab
        let imageName: String
        let paddingEdges: Edge.Set
        let tab: Tab
        let title: String
        
        var body: some View {
            VStack(spacing:0) {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .frame(width: 50, height: 40, alignment: .center)
                   
                    .foregroundColor(Color(self.currentView == tab ? .blue : .gray))
              
                Text(title)
                    .font(.system(size: 10))
                    .foregroundColor(Color(self.currentView == tab ? .blue : .gray))
                    .padding(0)
            }
            .frame( height: 60)
            .onTapGesture { self.currentView = self.tab }
    
        }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(currentView: .constant(.contact), imageName: "gear", paddingEdges: .leading, tab: .contact, title: "contact")
    }
}
