import SwiftUI

struct ContentView: View {
    @State var isAuthenticated: Bool = true
    
    var body: some View {
        if(isAuthenticated) {
            MainView()
        } else {
            Start()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
