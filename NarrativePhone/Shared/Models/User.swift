import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let accountName: String
    let email: String
    let nbId: String?
    let nbAuthorId: String?
    let nbOrganizationId: Int?
    let narrativePhoneId: String?
    let zoomUserId: String
    let zoomUserLastName: String
    let zoomUserFirstName: String
    let zoomUserEmail: String
    let description: String?
    let iconImg: String?
    let state: Int
}
