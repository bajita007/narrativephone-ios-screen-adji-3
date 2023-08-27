//
//  ModalFailedCall.swift
//  NarrativePhone
//
//  Created by RAHMAT ADJI HIDAYAT on 26/08/23.
//

import SwiftUI

struct ModalFailedCall: View {
    @Binding var isActive: Bool
    @State private var offset: CGFloat = 0
    let message: String = "Dalam Sedang Panggilan"
    func cancel() {
        offset = 0
        isActive = false
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                
                VStack(alignment: .center) {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(.green)
                        .clipShape(Circle())
                    
                    
                    Text(message)
                        .labelStyle(.titleOnly)
                        .foregroundColor(.black)
                    
                    
                    
                    
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

struct ModalFailedCall_Previews: PreviewProvider {
    static var previews: some View {
       ModalFailedCall(isActive:  .constant(false))
    }
}
