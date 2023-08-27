//
//  ChangePassword.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 26/08/23.
//

import SwiftUI

struct ModalChangePassword: View {
    @Binding var newPassword: String
    @Binding var password: String
    @Binding var isActive: Bool
    @State private var offset: CGFloat = 0
    let action: () -> Void
    let actionLabel: String

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
                    Text("Change Password")
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    
                    Label("Password", systemImage: "")
                        .labelStyle(.titleOnly)
                        .foregroundColor(.black)
                    
                    SecureField("", text: $password)
                        .textFieldStyle(.roundedBorder)
                   
                    
                    Label("New Password", systemImage: "")
                        .labelStyle(.titleOnly)
                        .foregroundColor(.black)
                    
                    SecureField("", text: $newPassword)
                        .textFieldStyle(.roundedBorder)
                        .padding(.bottom)
                    
                    HStack(spacing:0) {
                        Button {
                            cancel()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.secondary)
                                
                                Text("Cancel")
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

struct ModalChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ModalChangePassword(
            newPassword: .constant(""),
            password: .constant(""),
            isActive: .constant(false),
            action: {
                
            },
            actionLabel: "Simpan"
        )
    }
}
