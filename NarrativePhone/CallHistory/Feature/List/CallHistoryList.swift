import SwiftUI

struct CallHistoryList: View {
    private let tabs = ["すべて", "不在着信"]
    
    @State private var filter = 0
    
    @ObservedObject var vm = CallHistoryViewModel()

    var body: some View {
   
            GeometryReader { _ in
                switch vm.state {
                case .idle:
                    Color.clear.onAppear {
                        vm.getAll(filter: .all)
                    }
                case .loading:
                    LoadingView()
                case .success(let items):
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(items) { call in
                                CallHistoryListItem(call: call)
                            }
                        }
                    }
                case .failure(let error):
                    ErrorView(error: error)
                }
            }
            .navigationTitle("履歴")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Picker(selection: self.$filter, label: Text("Choose One")) {
                            ForEach(0..<tabs.count, id: \.self, content: { index in
                                Text(tabs[index])
                            })
                        }
                        .frame(width: 200)
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: filter) { newValue in
                            vm.getAll(
                                filter: newValue == 0
                                    ? CallHistoryListFilter.all
                                    : CallHistoryListFilter.missed)
                        }
                    }
                }
            }
        }
    

    
}

struct CallHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        CallHistoryList()
    }
}
