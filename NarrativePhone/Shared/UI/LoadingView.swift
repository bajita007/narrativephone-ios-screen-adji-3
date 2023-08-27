import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            
            
            ProgressView()
                .scaleEffect(1, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
        }    .frame(maxWidth: 400, alignment: .center)

    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
