//
//  AddPartiscipan.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 25/08/23.
//

import SwiftUI

struct AddPartiscipan: View {
    @ObservedObject var vm = ContactViewModel()
    
    @State var showModal: Bool = false
    
    @State var selectedContactCategory: String = ""
    
    var body: some View {
        
        ZStack {
            GeometryReader { _ in
                switch vm.state {
                case .idle:
                    Color.clear.onAppear {
                        vm.getContactCategories()
                    }
                case .loading:
                    LoadingView()
                case .success(let contactCategories):
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(contactCategories) { category in
                                Section(
                                    header: ItemGroupContactParticipan(
                                        category: category
                                      
                                    )
                                    .padding(.zero)
                                    .foregroundColor(.blue)
                                ) {
                                    // TODO: show loading state
                                    ForEach(vm.getByCategory(categoryId: category.id)) { contact in
                                        ItemContactPartisipan(contact: contact).onTapGesture {
                                            print("SELECT")
                                        }
                                    }
                                }
                            }
                        }
                    }
                case .failure(let error):
                    ErrorView(error: error)
                }
            }
            
            
        }
    
            
    
    }

}

struct AddPartiscipan_Previews: PreviewProvider {
    static var previews: some View {
        AddPartiscipan()
     
    }
}
