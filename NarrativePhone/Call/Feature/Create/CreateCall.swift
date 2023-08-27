import SwiftUI

struct CreateCall: View {
    @State var startMeeting: Bool = false
    @State var meetingNumber: String = ""
    @State var meetingPassword: String = ""
    @State var showModal: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State var listPartisipan : [AddressEntry] =
    [
    AddressEntry(
        id: 2,
        addressCategoryId: 1,
        name: "山田太郎",
        narrativePhoneId: "aasdflj",
        nbAuthorId: nil,
        nbOrganizationId: 1,
        description: "クロースフィールド株式会社　代表",
        iconImagePath: nil,
        favourite: true)
    ]
        

    var body: some View {
        
        ZStack{
            VStack {
                VStack {
                    VStack {
                        HStack(alignment: .center) {
                            
                            
                            VStack(alignment: .leading) {
                                // Caller account name
                                Text("個人用アカウント")
                                    .font(.headline)
                                    .colorMultiply(Color.black)
                            }
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20))
                        
                    }
                    
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 20, height: 15)
                        .foregroundColor(.black)
                        .padding(8)
                        .clipShape(Circle())
                    
                    ForEach(listPartisipan) { entry in
                        VStack {
                            HStack {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.blue)
                                    .clipShape(Circle())
                                
                                
                                VStack(alignment: .leading) {
                                    // Attendee name
                                    Text(entry.name)
                                        .font(.headline)
                                        .colorMultiply(Color.black)
                                    
                                    // Attendee description
                                    Text(entry.description ?? "")
                                        .font(.system(size: 12))
                                        .colorMultiply(.secondary)
                                }
                                
                                Spacer()
                            }
                            
                        }
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .background(.gray.opacity(0.2))
                        .cornerRadius(15)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 20))
                    }
                    
                 
                }
                
                
                
                
                
                NavigationLink(destination: AddPartiscipan(),
                               label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("通話先追加")
                    }
                    .foregroundColor(.green)
                    .padding(EdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20))
                }
                               
                )
                .background(.gray.opacity(0.35))
                .cornerRadius(15)
                
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .resizable()
                            .padding(12)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(.red)
                            .clipShape(Circle())
                            .onTapGesture {
                                print("CANCEL")
                                goBack()
                            }
                        
                        Spacer()
                        
                        
                        Button(action: {
                            self.showModal.toggle()
                        }) {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .padding(12)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.green)
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding(.top)
                    
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "mic.fill")
                            .resizable()
                            .frame(width: 30, height: 35)
                            .foregroundColor(.black)
                            .padding(12)
                        
                        Spacer()
                        
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 40, height: 35)
                            .foregroundColor(.black)
                            .padding(12)
                        
                        Spacer()
                    }
                }
                //               .frame(width: .infinity)
                .background(.gray.opacity(0.1))
                
                
            }
            if showModal {
                JoinMeetingDialog(
                    meetingId: $meetingNumber,
                    password: $meetingPassword,
                    isActive: $showModal,
                    action: {
                        showModal = false
                        startMeeting = true
                    },
                    actionLabel: "Join"
                )
            }
            
            if startMeeting{
                StartCallService(
                    delegate: StartCallService.Delegate(),
                    zoomMeetingNumber: $meetingNumber,
                    zoomPasscode: $meetingPassword
                )
            }
        }
        .navigationBarBackButtonHidden(true)

    }
    func goBack(){
           //here I save CoreData context if it changes
           self.presentationMode.wrappedValue.dismiss()
       }
}


struct CreateCall_Previews: PreviewProvider {
    static var previews: some View {
        CreateCall()
    }
}
