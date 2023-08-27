//
//  TabBar.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI

struct TabBar: View {
    @Binding var currentView: Tab
        @Binding var showModal: Bool

        var body: some View {
//            GeometryReader{ geo in
                HStack(alignment: .bottom) {
         
                    ShowModalTabBarItem() { self.showModal.toggle()
                    }.padding(.leading)
                    Spacer()
                    TabBarItem(currentView: self.$currentView, imageName: "star", paddingEdges: .leading, tab: .favorite, title:"お気に入り")
                    
                    Spacer()
                    TabBarItem(currentView: self.$currentView, imageName: "person.2", paddingEdges: .trailing, tab: .contact, title:"連絡先")
                    Spacer()
                    TabBarItem(currentView: self.$currentView, imageName: "clock", paddingEdges: .trailing, tab: .callHistory, title:"履歴")
                   
                    Spacer()
                    TabBarItem(currentView: self.$currentView, imageName: "gear", paddingEdges: .trailing, tab: .settings, title:"設定")
                        .padding(.trailing)
               
                }
                    .background(.gray.opacity(0.2))

          
        }
    }


    struct TabBar_Previews: PreviewProvider {
        static var previews: some View {
            TabBar(currentView: .constant(.contact), showModal: .constant(false))
        }
    }
