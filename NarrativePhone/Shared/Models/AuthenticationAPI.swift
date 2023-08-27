// Request payload for POST /authenticate/signin
struct SignInRequest: Codable {
    let loginId: String
    let password: String
    let phoneDeviceId: String
}

// Response from POST /authenticate/signin
struct SignInResponse: Codable {
    let state: String
}

// Request payload for GET /authenticate/app_sign_in_challenge
struct SignInChallengeRequest: Codable {
    let phoneDeviceId: String
}

// Response from GET /authenticate/app_sign_in_challenge
struct SignInChallengeResponse: Codable {
    let state: String
    let challenge: String
}

// Request payload for POST /authenticate/app_signin
struct AppSignInRequest: Codable {
    let loginId: String
    let phoneDeviceId: String
    let token: String
}

// Response from POST /authenticate/app_signin
struct AppSignInResponse: Codable {
    let state: String
}

// Request payload for PUT /authenticate/switch_account
struct SwitchAccountRequest: Codable {
    let loginId: String
}

// Response from PUT /authenticate/switch_account
struct SwitchAccountResponse: Codable {
    let state: String
    let signinUserId: Int
    let signinNarrativePhoneId: String
    let signinDeviceId: String
}

// Response from DELETE /authenticate/signout
struct SignOutResponse: Codable {
    let state: String
}

// Response from GET /authenticate/current_signin
struct CurrentSignInResponse: Codable {
    let state: String
    let signinUserId: Int
    let signinNarrativePhoneId: String
    let signinDeviceId: String
}

// Request payload for POST /authenticate/system_admin_signin
struct SystemAdminSignInRequest: Codable {
    let loginId: String
    let password: String
}

// Response from POST /authenticate/system_admin_signin
struct SystemAdminSignInResponse: Codable {
    let state: String
}

// Response from DELETE /authenticate/system_admin_signout
struct SystemAdminSignOutResponse: Codable {
    let state: String
}

// Response from GET /authenticate/current_signin_admin
struct CurrentSignInAdminResponse: Codable {
    let state: String
    let systemAdminId: Int
    let systemAdminEmail: String
    let systemAdminName: String
}
