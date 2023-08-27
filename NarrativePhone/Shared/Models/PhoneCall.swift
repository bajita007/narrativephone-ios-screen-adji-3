import Foundation

struct PhoneCall: Identifiable, Codable {
    let id: Int
    let ownerNarrativePhoneId: String
    let ownerDeviceId: String?
    let triggeredAt: Date
    let callEndAt: Date?
    let zoomMeetingUrl: String
    let callbackUrl:String
    
    var callTime: String {
        // TODO: change to time if the call is triggered today
        // otherwise, show the day of the call
        return triggeredAt.formatted()
    }
    
    // Imitating phone call status
    // 1 for outgoing call
    // 2 for incoming call
    // 3 for missed call
    var status: Int {
        return  Int.random(in: 1..<4)
    }
    
    // Imitating owner relationship
    var callerName: String {
        return "山田太郎"
    }
    
    // Imitating owner relationship
    var callerDescription: String {
        return "クロースフィールド株式会社　代表"
    }
}
