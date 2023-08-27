struct RegisterPhoneDeviceRequest: Codable {
    let phoneDeviceId: String
    let phoneDeviceDescription: String
}

struct RegisteredPhoneDeviceUser: Codable {
    let id: Int
    let name: String
    let email: String
    let nphoneId: String
    let description: String
    let iconImagePath: String
    let state: String
}

struct PhoneDeviceInfo: Codable {
    let phoneDeviceId: String
    let phoneDeviceDescription: String
    // TODO: convert to datetime
    let createdAt: String
    let available: Bool
}

// Request payload for POST /phone_device
struct CreatePhoneDeviceRequest: Codable {
    let phoneDevice: RegisterPhoneDeviceRequest
}

// Response from POST /phone_device
struct CreatePhoneDeviceResponse: Codable {
    let state: String
    let user: RegisteredPhoneDeviceUser
    let phoneDevice: PhoneDeviceInfo
}

// Request payload for GET /phone_devices
struct PhoneDeviceInfoRequest: Codable {
    let id: String
}

// Response from GET /phone_devices
struct PhoneDeviceInfoResponse: Codable {
    let state: String
    let phoneDevice: PhoneDeviceInfo
}

// Request payload for PUT /phone_devices
struct UpdatePhoneDeviceRequest: Codable {
    let phoneDevice: RegisterPhoneDeviceRequest
}

// Response from PUT /phone_devices
struct UpdatePhoneDeviceResponse: Codable {
    let state: String
    let phoneDevice: PhoneDeviceInfo
}

// Request payload for DELETE /phone_devices
struct DeletePhoneDeviceRequest: Codable {
    let id: String
}

// Response from DELETE /phone_devices
struct DeletePhoneDeviceResponse: Codable {
    let state: String
}

// Request payload for PUT /phone_devices/register
struct UpdateConnectedPhoneDeviceRequest: Codable {
    let id: String
}

// Response from PUT /phone_devices/register
struct UpdateConnectedPhoneDeviceResponse: Codable {
    let state: String
    let phoneDeviceAuthenticateToken: String
}
