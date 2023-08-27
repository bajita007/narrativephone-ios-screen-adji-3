import SwiftUI

struct CallHistoryListItem: View {
    let call : PhoneCall
    
    var statusColor: Color {
        get {
            if (call.status == 1) {
                return Color.green
            }
            
            if (call.status == 2) {
                return Color.blue
            }
            
            return Color.red
        }
    }
    
    var statusLabel: String {
        get {
            if (call.status == 1) {
                return "着信"
            }
            
            if (call.status == 2) {
                return "発信"
            }
            
            return "不在着信"
        }
    }
    
    var body: some View {
        Divider()
        
        VStack(alignment: .leading) {
            HStack{
                HStack{
                    Text(call.ownerNarrativePhoneId)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                    
                    Image(systemName: call.status == 1
                          ? "arrowshape.right.fill"
                          : "arrowshape.backward.fill"
                    )
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.gray)
                    
                    Text(call.ownerNarrativePhoneId)
                        .font(.system(size: 12))
                        .foregroundStyle(call.status == 3 ? .red:.gray)
                }
                
                Spacer()
                
                Text(call.callTime)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(call.callerName)
                        .font( .headline)

                    Text(call.callerDescription)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                }
                .padding(.leading)
                
                Spacer()
                if call.status == 3 {
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.green)
                        .clipShape(Circle())
                }
            }
           
            // Call participants
            if (call.status != 3) {
                Divider()
                
                VStack(alignment: .leading) {
                    Text(call.callerName).font(.system(size: 16))
                    Text(call.callerDescription).font(.system(size: 12))
                }
                .padding(.leading)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        
        Divider()
    }
}

struct CallHistoryListItem_Previews: PreviewProvider {
    static var previews: some View {
        CallHistoryListItem(
            call: PhoneCall(
                id: 1,
                ownerNarrativePhoneId: "yamada",
                ownerDeviceId: nil,
                triggeredAt: Date(),
                callEndAt: Date(),
                zoomMeetingUrl: "zoom-url",
                callbackUrl: "callback-url"
            )
        )
    }
}
