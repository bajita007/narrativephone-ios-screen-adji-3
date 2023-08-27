//
//  CurrentView.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 27/08/23.
//

import SwiftUI

struct CurrentScreen: View {
    @Binding var currentView: Tab

    var body: some View {
        VStack {
            switch currentView {
            case .favorite:
                FavoriteContactList()
            case .contact:
                ContactList()
            case .callHistory:
                CallHistoryList()
            case .settings:
                AccountSettings()
            }
        }
    }
}

struct CurrentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScreen(currentView: .constant(.contact))
    }
}
