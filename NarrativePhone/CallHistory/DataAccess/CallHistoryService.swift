import Foundation

enum CallHistoryListFilter: CaseIterable {
    case all
    case missed
}

class CallHistoryService {
    let dateFormatter = DateFormatter()
    
    func getCallHistoryList(filter: CallHistoryListFilter) -> [PhoneCall] {
        dateFormatter.dateFormat = "dd/MM/yy HH:mm:ss"
        
        if (filter == .missed) {
            return [
                PhoneCall(
                    id: 1,
                    ownerNarrativePhoneId: "yamada",
                    ownerDeviceId: nil,
                    triggeredAt: dateFormatter.date(from: "08/08/2023 20:30:00")!,
                    callEndAt: dateFormatter.date(from: "08/08/2023 20:45:00"),
                    zoomMeetingUrl: "zoom-url",
                    callbackUrl: "callback-url"
                ),
                PhoneCall(
                    id: 2,
                    ownerNarrativePhoneId: "yamada",
                    ownerDeviceId: nil,
                    triggeredAt: dateFormatter.date(from: "08/08/2023 20:30:00")!,
                    callEndAt: dateFormatter.date(from: "08/08/2023 20:45:00"),
                    zoomMeetingUrl: "zoom-url",
                    callbackUrl: "callback-url"
                )
            ]
        }
        
        return [
            PhoneCall(
                id: 1,
                ownerNarrativePhoneId: "yamada",
                ownerDeviceId: nil,
                triggeredAt: dateFormatter.date(from: "08/08/2023 20:30:00")!,
                callEndAt: dateFormatter.date(from: "08/08/2023 20:45:00"),
                zoomMeetingUrl: "zoom-url",
                callbackUrl: "callback-url"
            ),
            PhoneCall(
                id: 2,
                ownerNarrativePhoneId: "yamada",
                ownerDeviceId: nil,
                triggeredAt: dateFormatter.date(from: "08/08/2023 20:30:00")!,
                callEndAt: dateFormatter.date(from: "08/08/2023 20:45:00"),
                zoomMeetingUrl: "zoom-url",
                callbackUrl: "callback-url"
            ),
            PhoneCall(
                id: 3,
                ownerNarrativePhoneId: "yamada",
                ownerDeviceId: nil,
                triggeredAt: dateFormatter.date(from: "08/08/2023 20:30:00")!,
                callEndAt: dateFormatter.date(from: "08/08/2023 20:45:00"),
                zoomMeetingUrl: "zoom-url",
                callbackUrl: "callback-url"
            )
        ]
    }
}
