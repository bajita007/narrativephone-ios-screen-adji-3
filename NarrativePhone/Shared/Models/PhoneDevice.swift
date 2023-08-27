import Foundation

struct PhoneDevice: Identifiable, Codable {
    let id: Int
    let userId: Int
    let phoneDeviceId: String
    let phoneDeviceDescription: String
    let createdAt: Date
    let available: Bool
    let deleted: Bool
}
