struct SystemAdminInfo: Codable {
    let id: Int
    let name: String
    let email: String
}

struct UpdatedSystemAdmin: Codable {
    let id: Int
    let email: String
    let name: String
    let tel: String
}

// Response from GET /system_admins/list
struct SystemAdminListResponse: Codable {
    let state: String
    let systemAdmins: [SystemAdminInfo]
}

// Request payload for POST /system_admins
struct CreateSystemAdminRequest: Codable {
    let token: String
    let email: String
    let name: String
    let tel: String
    let password: String
    let passwordConfirmation: String
}

// Response from POST /system_admins
struct CreateSystemAdminResponse: Codable {
    let state: String
}

// Request payload for PUT /system_admins
struct UpdateSystemAdminRequest: Codable {
    let email: String
    let name: String
    let tel: String
}

// Response from PUT /system_admins
struct UpdateSystemAdminResponse: Codable {
    let state: String
    let validateMailSent: Bool
    let systemAdmin: UpdatedSystemAdmin
}

// Request payload for DELETE /system_admins
struct DeleteSystemAdminRequest: Codable {
    let id: Int
}

// Response from DELETE /system_admins
struct DeleteSystemAdminResponse: Codable {
    let state: String
}

// Request payload for GET /system_admin/email_available
struct SystemAdminEmailAvailableRequest: Codable {
    let email: String
}

// Response from GET /system_admin/email_available
struct SystemAdminEmailAvailableResponse: Codable {
    let state: String
    let available: Bool
}

// Request payload for GET /system_admin/name_available
struct SystemAdminNameAvailableRequest: Codable {
    let email: String
}

// Response from GET /system_admin/name_available
struct SystemAdminNameAvailableResponse: Codable {
    let state: String
    let available: Bool
}

// Request payload for PUT /system_admins/validate_mail
struct SystemAdminValidateMailRequest: Codable {
    let token: String
    let email: String
}

// Response from PUT /system_admin/validate_mail
struct SystemAdminValidateMailResponse: Codable {
    let state: String
}

// Request payload for GET /system_admin/forgot_password
struct SystemAdminForgotPasswordRequest: Codable {
    let email: String
}

// Response from GET /system_admin/forgot_password
struct SystemAdminForgotPasswordResponse: Codable {
    let state: String
}

// Request payload for PUT /system_admins/reset_password
struct SystemAdminResetPasswordRequest: Codable {
    let email: String
    let token: String
    let password: String
    let passwordConfirm: String
}

// Response from PUT /system_admins/reset_password
struct SystemAdminResetPasswordResponse: Codable {
    let state: String
}

// Request payload for PUT /system_admins/update_password
struct SystemAdminUpdatePasswordRequest: Codable {
    let password: String
    let passwordConfirm: String
}

// Response from PUT /system_admins/update_password
struct SystemAdminUpdatePasswordResponse: Codable {
    let state: String
}
