class FavoriteContactService {
    func getAll() -> [AddressEntry] {
        return [
            AddressEntry(
                id: 1,
                addressCategoryId: 1,
                name: "山田太郎",
                narrativePhoneId: "aasdflj",
                nbAuthorId: nil,
                nbOrganizationId: 1,
                description: "クロースフィールド株式会社　代表",
                iconImagePath: nil,
                favourite: true
            ),
            AddressEntry(
                id: 2,
                addressCategoryId: 1,
                name: "山田太郎",
                narrativePhoneId: "aasdflj",
                nbAuthorId: nil,
                nbOrganizationId: 1,
                description: "クロースフィールド株式会社　代表",
                iconImagePath: nil,
                favourite: true
            )
        ]
        
    }
}
