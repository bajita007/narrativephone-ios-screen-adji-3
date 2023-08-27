class ContactService {
    func getByCategory(categoryId: Int) -> [AddressEntry] {
        let contacts = [
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
            ),
            AddressEntry(
                id: 3,
                addressCategoryId: 2,
                name: "山田太郎",
                narrativePhoneId: "aasdflj",
                nbAuthorId: nil,
                nbOrganizationId: 1,
                description: "クロースフィールド株式会社　代表",
                iconImagePath: nil,
                favourite: true
            )
        ]
        
        return contacts.filter({ $0.addressCategoryId == categoryId })
    }
    
    func getContactCategories() -> [AddressCategory] {
        return [
            AddressCategory(id: 1, name: "仕事", userId: 1),
            AddressCategory(id: 2, name: "個人", userId: 1)
        ]
    }
    
    func getContactCategory(id: Int) -> AddressCategory {
        let categories = getContactCategories()
        
        let category = categories.first { item in
            item.id == id
        }
        
        return category ?? AddressCategory(id: 1, name: "仕事", userId: 1)
    }
}
