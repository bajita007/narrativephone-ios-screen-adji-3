import Combine
import Foundation

class AccountViewModel: ObservableObject {
    enum ViewState {
        case idle
        case loading
        case success(accounts: [User])
        case failure(error: String)
    }
    
    @Published var state: ViewState = .idle
    
    @Published var showLoadingModal: Bool = false
    
    private var cancelables = Set<AnyCancellable>()
    
    private let service = AccountService()
    
    func getAll() {
        self.state = .loading
        
        service.getAll().publisher.collect()
            .delay(for: 1, scheduler: RunLoop.main)
            .sink { complete in
                switch complete {
                case .finished:
                    print("ACCOUNT COMPLETE")
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
            } receiveValue: { accounts in
                self.state = .success(accounts: accounts)
            }.store(in:&cancelables)
    }
    
    func updateAccount() {
        self.showLoadingModal = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showLoadingModal = false
        }
    }
}

