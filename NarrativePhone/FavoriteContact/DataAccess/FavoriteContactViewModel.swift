import Combine
import Foundation

class FavoriteContactViewModel: ObservableObject {
    enum ViewState {
        case idle
        case loading
        case success(favorites: [AddressEntry])
        case failure(error: String)
    }
    
    @Published var state: ViewState = .idle
    
    private var cancelables = Set<AnyCancellable>()
    
    private let service = FavoriteContactService()

    func getAll() {
        state = .loading
       
        service.getAll().publisher.collect()
            .delay(for: 1, scheduler: RunLoop.main)
            .sink { complete in
                switch complete {
                case .finished:
                    print("FAVORITE CONTACT COMPLETE")
                case .failure(let error):
                    self.state = .failure(error: error.localizedDescription)
                }
            } receiveValue: { favorites in
                self.state = .success(favorites: favorites)
            }.store(in:&cancelables)
    }
    
}

