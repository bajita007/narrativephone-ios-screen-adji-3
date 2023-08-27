import SwiftUI

struct ContactList: View {
	@ObservedObject var vm = ContactViewModel()
	
	@State var showModal: Bool = false
	
	@State var selectedContactCategory: String = ""
	
	var body: some View {

		ZStack {
			GeometryReader { _ in
				switch vm.state {
				case .idle:
					Color.clear.onAppear {
						vm.getContactCategories()
					}
				case .loading:
					LoadingView()
				case .success(let contactCategories):
					ScrollView {
						VStack(spacing: 0) {
							ForEach(contactCategories) { category in
								Section(
									header: ContactGroupHeading(
										category: category,
										onEditClicked: { category in
											showModal = true
											selectedContactCategory = category.name
										}
									)
									.padding(.zero)
									.foregroundColor(.blue)
								) {
									// TODO: show loading state
									ForEach(vm.getByCategory(categoryId: category.id)) { contact in
										ContactListItem(contact: contact)
									}
								}
							}
						}
					}
				case .failure(let error):
					ErrorView(error: error)
				}
			}
			
			
			if showModal {
				ContactCategoryModal(
					title: selectedContactCategory == ""
					? "連絡先グループ追加" // Add group
					: "連絡先グループ名変更", // Edit group
					action: {
						vm.addUpdateGroup()
						showModal = false
						selectedContactCategory = ""
					},
					actionLabel: selectedContactCategory == ""
					? "追加" // Add
					: "変更", // Update
					isActive: $showModal,
					categoryName: $selectedContactCategory
				)
			}
			
			if(vm.showLoadingModal){
				LoadingModal()
			}
		}
			
					.navigationTitle("連絡先")
					.navigationBarItems(
						trailing: Button {
							selectedContactCategory = ""
							showModal = true
						} label: {
							// Add Contact Category
							Text("グループ追加")
						}
					)
	}
}

struct ContactList_Previews: PreviewProvider {
	static var previews: some View {
		ContactList()
	}
}

