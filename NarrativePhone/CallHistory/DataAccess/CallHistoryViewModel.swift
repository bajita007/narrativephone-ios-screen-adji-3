import Foundation
import Combine

class CallHistoryViewModel: ObservableObject {
    enum ViewState {
        case idle
        case loading
        case success(callHistory: [PhoneCall])
        case failure(error: String)
    }
    
    @Published var state: ViewState = .idle
    
    private var cancelables = Set<AnyCancellable>()
    
    private let service = CallHistoryService()

    func getAll(filter: CallHistoryListFilter) {
        state = .loading
    
        service.getCallHistoryList(filter: filter).publisher.collect()
            .delay(for: 1, scheduler: RunLoop.main)
            .sink { complete in
                switch complete {
                    case .finished:
                        print("CALL HISTORY COMPLETE")
                    case .failure(let error):
                        self.state = .failure(error: error.localizedDescription)
                }
                
            } receiveValue: { callHistory in
                self.state = .success(callHistory: callHistory)
            }.store(in:&cancelables)
    }
}
