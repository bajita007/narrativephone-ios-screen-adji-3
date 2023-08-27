import SwiftUI

struct ErrorView: View {
    let error: String
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Text(error)
                .font(.headline.bold())
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Failed to load resource")
    }
}
