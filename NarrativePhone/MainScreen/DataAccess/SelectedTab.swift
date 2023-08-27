import SwiftUI
import Combine

final class SelectedTab: ObservableObject {
    let customActionteminidex = 0

    let objectWillChange = PassthroughSubject<SelectedTab, Never>()
    
    var isCustomItemSelected: Bool = false

    var itemSelected: Int {
        didSet {
            if itemSelected == 0 {
                isCustomItemSelected = true
                itemSelected = oldValue
            }
            objectWillChange.send(self)
            
        }
    }

    init(initialIndex: Int = 2) {
        self.itemSelected = initialIndex
    }
}
