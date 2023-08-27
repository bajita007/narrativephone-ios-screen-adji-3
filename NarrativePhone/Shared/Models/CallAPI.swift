struct PhoneCallAttendeeReq: Codable {
    let narrativePhoneId: String
}

struct PhoneCallReq: Codable {
    let owner: String
    let ownerDeviceId: String
    let zoomMeetingUrl: String
    let callbackUrl: String
    let attendees: [PhoneCallAttendeeReq]
}

struct AttendeeInfo: Codable {
    let narrativePhoneId: String
    let joined: Bool
    // TODO: convert to datetime
    let responseAt: String
    let message: String
}

struct PhoneCallInfo: Codable {
    let owner: String
    let ownerDeviceId: String
    let zoomMeetingUrl: String
    let callbackUrl: String
    // TODO: convert to datetime
    let triggeredAt: String
    let attendees: [AttendeeInfo]
}

// Request payload for POST /phone_calls
struct CreatePhoneCallRequest: Codable {
    let phoneCall: PhoneCallReq
}

// Response from POST /phone_calls
struct CreatePhoneCallResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload for PUT /phone_calls/resend
struct PhoneCallResendRequest: Codable {
    let phoneCall: PhoneCallReq
}

// Response from PUT /phone_call/resend
struct PhoneCallResendResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload for PUT /phone_calls/answer
struct PhoneCallAnswerRequest: Codable {
    let phoneCallId: Int
    let attendeeId: String
    let attendeeDeviceId: String
}

// Response from PUT /phone_calls/answer
struct PhoneCallAnswerResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload for PUT /phone_calls/reject
struct PhoneCallRejectRequest: Codable {
    let phoneCallId: Int
    let attendeeId: String
    let attendeeDeviceId: String
    let message: String
}

// Response from PUT /phone_calls/reject
struct PhoneCallRejectResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload for PUT /phone_calls/hang_up
struct PhoneCallHangUpRequest: Codable {
    let phoneCallId: Int
    let attendeeId: String
    let attendeeDeviceId: String
}

// Response from PUT /phone_calls/hang_up
struct PhoneCallHangUpResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload for PUT /phone_calls/finished
struct PhoneCallFinishedRequest: Codable {
    let phoneCallId: Int
}

// Response from PUT /phone_calls/finished
struct PhoneCallFinishedResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload for PUT /phone_calls/add_attendee
struct PhoneCallAddAttendeeRequest: Codable {
    let phoneCallId: Int
    let attendeeId: String
}

// Response from PUT /phone_calls/add_attendee
struct PhoneCallAddAttendeeResponse: Codable {
    let state: String
    let phoneCallId: Int
}

// Request payload GET /call_histories
struct CallHistoryInfoRequest: Codable {
    let id: Int
}

// Response from GET /call_histories
struct CallHistoryInfoResponse: Codable {
    let state: String
    let phoneCall: PhoneCallInfo
}

// Request payload GET /call_histories/list
struct CallHistoryListRequest: Codable {
    let offset: Int
    let limit: Int
}

// Response from GET /call_histories/list
struct CallHistoryListResponse: Codable {
    let state: String
    let phoneCalls: [PhoneCallInfo]
}
