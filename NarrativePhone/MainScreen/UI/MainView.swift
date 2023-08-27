//
//  MainView.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI

struct MainView: View {
    @State private var currentView: Tab = .contact
    @State private var showModal: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                CurrentScreen(currentView: self.$currentView)
                TabBar(currentView: self.$currentView, showModal: self.$showModal)
            }
        }
        .background(Color(.white))
        .navigationViewStyle(StackNavigationViewStyle())
        .alert("ユーザ切り替え", isPresented: self.$showModal, actions: {
            Button("山田太郎", action: {})
            Button("山田二郎", action: {})
            Button("キャンセル", role: .cancel, action: {})
            
        }, message: {
            Text("ユーザ切り替え")
        }
               
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
