struct AddressExchangeTokenUser: Codable {
    let narrativePhoneId: String
    let name: String
    let description: String
}

struct AddressExchangeToken: Codable {
    let id: Int
    let addressCategoryId: Int
    let user: AddressExchangeTokenUser
    let token: String
    // TODO: convert to datetime
    let createdAt: String
    // TODO: convert to datetime
    let usedAt: String
    let exchangedUser: AddressExchangeTokenUser
}

struct ExchangedToken: Codable {
    let id: Int
    let addressCategoryId: Int
    let user: AddressExchangeTokenUser
    let token: String
    // TODO: convert to datetime
    let createdAt: String
    // TODO: convert to datetime
    let usedAt: String
}

struct ExchangeAddressTargetUser: Codable {
    let id: Int
    let addressCategoryId: Int
}

struct NarrativeBookAddress: Codable {
    let narrativePhoneId: String
    let nbid: String
    let authorId: String
    let name: String
    let description: String
    let iconImagePath: String
}

struct AddressEntryResp: Codable {
    let name: String
    let narrativePhoneId: String
    let nbAuthorId: String
    let nbOrganizationId: String
    let description: String
    let iconImgPath: String
    let favourite: Bool
}

struct AddressCategoryResp: Codable {
    let id: Int
    let name: String
}

struct AddressCategoryWithEntriesCountResp: Codable {
    let id: Int
    let name: String
    let entryCount: Int
}

struct AddressCategoryWithEntriesResp: Codable {
    let id: Int
    let name: String
    let entries: Int
}

// Request payload for GET /address_exchange_tokens
struct AddressExchangeTokenRequest: Codable {
    let id: Int
}

// Response from GET /address_exchange_tokens
struct AddressExchangeTokenResponse: Codable {
    let state: String
    let addressExchangeToken: AddressExchangeToken
}

// Request payload for POST /address_exchage_tokens
struct ExchangeAddressRequest: Codable {
    let addressExchangeToken: ExchangeAddressTargetUser
}

// Response from POST /address_exchange_tokens
struct ExchangeAddressResponse: Codable {
    let state: String
    let addressExchangeToken: ExchangedToken
}

// Request payload for GET /address_exchange_tokens/validate
struct ExchangeAddressTokenValidateRequest: Codable {
    let token: String
}

// Response from GET /address_exchange_tokens/validate
struct ExchangeAddressTokenValidateResponse: Codable {
    let state: String
    let addressExchangeToken: ExchangedToken
}

// Request payload for PUT /address_exchange_tokens/admit
struct ExchangeAddressTokenAdmitRequest: Codable {
    let token: String
}

// Response from PUT /address_exchange_tokens/admit
struct ExchangeAddressTokenAdmitResponse: Codable {
    let state: String
    let addressExchangeToken: AddressExchangeToken
}

// Request payload for PUT /address_exchange_tokens/register
struct ExchangeAddressTokenRegisterRequest: Codable {
    let id: String
}

// Response from PUT /address_exchange_tokens/register
struct ExchangeAddressTokenRegisterResponse: Codable {
    let state: String
    let addressExchangeToken: AddressExchangeToken
}

// Response from GET /narrativebook_addresses
struct NarrativeBookAdressesResponse: Codable {
    let state: String
    let addresses: [NarrativeBookAddress]
}

// Request payload for POST /address_categories
struct CreateAddressCategoryRequest: Codable {
    let name: String
}

// Response from POST /address_categories
struct CreateAddressCategoryResponse: Codable {
    let state: String
    let addressCategory: AddressCategoryResp
}

// Request payload for PUT /address_categories
struct UpdateAddressCategoryRequest: Codable {
    let id: Int
    let name: String
}

// Response from PUT /address_categories
struct UpdateAddressCategoryResponse: Codable {
    let state: String
    let addressCategory: AddressCategoryResp
}

// Request payload for GET /address_categories
struct AddressCategoryInfoRequest: Codable {
    let id: Int
}

// Response from GET /address_categories
struct AddressCategoryInfoResponse: Codable {
    let state: String
    let addressCategory: AddressCategoryResp
}

// Request payload for DELETE /address_categories
struct DeleteAddressCategoryRequest: Codable {
    let id: Int
    let force: Bool
}

// Response from DELETE /address_categories
struct DeleteAddressCategoryResponse: Codable {
    let state: String
    let addressCategory: AddressCategoryWithEntriesCountResp
}

// Response from GET /address_categories/list
struct AddressCategoryListResponse: Codable {
    let state: String
    let addressCategories: AddressCategoryWithEntriesCountResp
}

// Response from GET /address_categories/list_with_entries
struct AddressCategoryListWithEntriesResponse: Codable {
    let state: String
    let addressCategories: AddressCategoryWithEntriesResp
}

// Request payload for GET /address_categories/update_list
struct AddressCategoryUpdateListRequest: Codable {
    // TODO: convert from datetime
    let from: String
}

// Response from GET /address_categories/update_list
struct AddressCategoryUpdateListResponse: Codable {
    let state: String
    let addressCategories: AddressCategoryWithEntriesResp
}

// Request payload for POST /address_entries
struct CreateAddressEntryRequest: Codable {
    let addressCategoryId: Int
    let name: String
    let narrativePhoneId: String
    let nbAuthorId: String
    let nbOrganizationId: Int
    let description: String
    let iconImagePath: String
    let favourite: Bool
}

// Response from POST /address_entries
struct CreateAddressEntryResponse: Codable {
    let state: String
    let addressEntry: CreateAddressEntryRequest
}

// Request payload for PUT /address_entries
struct UpdateAddressEntryRequest: Codable {
    let id: Int
    let addressCategoryId: Int
    let name: String
    let narrativePhoneId: String
    let nbAuthorId: String
    let nbOrganizationId: Int
    let description: String
    let iconImagePath: String
    let favourite: Bool
}

// Response from PUT /address_entries
struct UpdateAddressEntryResponse: Codable {
    let state: String
    let addressEntry: AddressEntry
}

// Request payload for DELETE /address_entries
struct DeleteAddressEntryRequest: Codable {
    let id: Int
}

// Response from DELETE /address_entries
struct DeleteAddressEntryResponse: Codable {
    let state: String
    let addressEntry: AddressEntry
}

// Request payload for GET /address_entries
struct AddressEntryInfoRequest: Codable {
    let id: Int
}

// Response from GET /address_entries
struct AddressEntryInfoResponse: Codable {
    let state: String
    let addressEntry: AddressEntry
}

// Request payload for GET /address_entries/list
struct AddressEntriesListRequest: Codable {
    let addressCategoryId: Int
}

// Response from GET /address_entries/list
struct AddressEntriesListResponse: Codable {
    let state: String
    let addressEntries: [AddressEntry]
}

// Request payload for GET /address_entries/update_list
struct AddressEntriesUpdateListRequest: Codable {
    let addressCategoryId: Int
    // TODO: convert to datetime
    let from: String
}

// Response from GET /address_entries/update_list
struct AddressEntriesUpdateListResponse: Codable {
    let state: String
    let addressEntries: [AddressEntry]
}
