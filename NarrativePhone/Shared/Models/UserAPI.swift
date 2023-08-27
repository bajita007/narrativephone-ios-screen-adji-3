struct UserInfo: Codable {
    let id: Int
    let accountName: String
    let name: String
    let email: String
    let nbId: String
    let nbAuthorId: String
    let nbOrganizationId: Int
    let narrativePhoneId: String
    let zoomUserId: String
    let zoomUserLastName: String
    let zoomUserFirstName: String
    let zoomUserEmail: String
    let description: String
    let iconImgPath: String
    let state: Int
    let stateJp: String
}

struct AuthorInfo: Codable {
    let nbid: String
    let authorId: String
    let name: String
    let nphoneId: String?
    let potratePath: String
}

struct UserRegistrationRequest: Codable {
    let name: String
    let accountName: String
    let description: String
    let password: String
    let passwordConfirmation: String
    let nbAuthorId: String
    let nbOrganizationId: Int?
    // TODO: search blob type in swift
    // let iconImage: Blob
}

struct PhoneDeviceRegistrationRequest: Codable {
    let phoneDeviceDescription: String
    let pushTarget: Int
}

struct CreatedUser: Codable {
    let id: Int
    let name: String
    let accountName: String
    let email: String
    let nphoneId: String
    let description: String
    let iconImagePath: String
    let state: String
}

struct UpdatedUser: Codable {
    let id: Int
    let name: String
    let accountName: String
    let email: String
    let nphoneId: String
    let description: String
    let iconImagePath: String
    let state: String
}

struct UpdatedPhoneDevice: Codable {
    let phoneDeviceId: String
    let phoneDeviceDescription: String
    // TODO: change to datetime
    let createdAt: String
    let phoneDeviceAuthenticateToken: String
}

// Request payload for POST /user_mail_validation
struct UserMailValidationRequest: Codable {
    let email: String
    let name: String
}

// Response from POST /user_mail_validation
struct UserMailValidationResponse: Codable {
    let state: String
}

// Request payload for PUT /user_mail_validation/admin
struct UserMailValidationAdmitRequest: Codable {
    let token: String
}


// Response from PUT /user_mail_validation/admin
struct UserMailValidationAdmitResponse: Codable {
    let state: String
}

// Response from GET /users
struct UserInfoResponse: Codable {
    let state: String
    let user: UserInfo
}

// Response from GET /users/available_authors
struct AvailableAuthorsResponse: Codable {
    let state: String
    let authors: [AuthorInfo]
}

// Request payload for GET /users/name_available
struct UserNameAvailableRequest: Codable {
    let accountName: String
}

// Response from GET /users/name_available
struct UserNameAvailableResponse: Codable {
    let state: String
    let available: Bool
}

// Request payload for POST /users
struct CreateUserRequest: Codable {
    let mailValidateToken: String
    let user: UserRegistrationRequest
}

// Response from POST /users
struct CreateUserResponse: Codable {
    let state: String
    let user: CreatedUser
}

// Request payload for PUT /users
struct UpdateUserRequest: Codable {
    let name: String
    let accountName: String
    let description: String
    // TODO: search blob type in swift
    // let iconImage: Blob
}

// Response from PUT /users
struct UpdateUserResponse: Codable {
    let state: String
    let user: UpdatedUser
}

// Response from DELETE /users
struct DeleteUserResponse: Codable {
    let state: String
}

// Request payload for POST /users/create_with_device
struct CreateUserWithDeviceRequest: Codable {
    let mailValidateToken: String
    let user: UserRegistrationRequest
    let phoneDevice: PhoneDeviceRegistrationRequest
}

// Response from POST /users/create_with_device
struct CreateUserWithDeviceResponse: Codable {
    let state: String
    let user: UpdatedUser
    let phoneDevice: UpdatedPhoneDevice
}

// Request payload for GET /users/forgot_password
struct UserForgotPasswordRequest: Codable {
    let accountName: String
}

// Response from GET /users/forgot_password
struct UserForgotPasswordResponse: Codable {
    let state: String
}

// Request payload for PUT /users/reset_password
struct UserResetPasswordRequest: Codable {
    let accountName: String
    let token: String
    let password: String
    let passwordConfirm: String
}

// Response from PUT /users/reset_password
struct UserResetPasswordResponse: Codable {
    let state: String
}

// Request payload for PUT /users/update_password
struct UserUpdatePasswordRequest: Codable {
    let password: String
    let passwordConfirm: String
}

// Response from PUT /users/update_password
struct UserUpdatePasswordResponse: Codable {
    let state: String
}
