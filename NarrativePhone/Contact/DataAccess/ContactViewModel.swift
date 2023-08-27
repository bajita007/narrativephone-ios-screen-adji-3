import Combine
import Foundation

class ContactViewModel: ObservableObject {
    enum ViewState {
        case idle
        case loading
        case success(contactCategories: [AddressCategory])
        case failure(error: String)
    }
    
    @Published var state: ViewState = .idle
    
    @Published var showLoadingModal: Bool = false
    
    private var cancelables = Set<AnyCancellable>()
    
    private let service = ContactService()

    func getContactCategories() {
        self.state = .loading
        
        service.getContactCategories().publisher.collect()
            .delay(for: 2, scheduler: RunLoop.main)
            .sink { complete in
                switch complete {
                case .finished:
                    print("CONTACT COMPLETE")
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
            } receiveValue: { contactCategories in
                self.state = .success(contactCategories: contactCategories)
            }.store(in:&cancelables)
    }
    
    func getByCategory(categoryId: Int) -> [AddressEntry] {
       return service.getByCategory(categoryId: categoryId)
    }
    
    func getContactCategory(id: Int) -> AddressCategory {
        return service.getContactCategory(id: id)
    }
    
    func addUpdateGroup(){
        self.showLoadingModal = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showLoadingModal = false
        }
    }
    
    func importContact(){
        self.showLoadingModal = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showLoadingModal = false
        }
    }
}


