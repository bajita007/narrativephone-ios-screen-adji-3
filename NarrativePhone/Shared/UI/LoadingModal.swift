import SwiftUI

struct LoadingModal: View {
    let message: String
    
    @State private var offset: CGFloat
    
    init(message: String = "Loading") {
        self.message = message
        self.offset = 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.5)
                
                VStack {
                    ProgressView()
                        .scaleEffect(1, anchor: .center)
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        .padding(.bottom)
                    
                    Text(message)
                }
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: geometry.size.width*0.75, height: 125)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 20)
                .padding()
                .offset(x: 0, y: offset)
                .onAppear {
                    withAnimation(.spring()) {
                        offset = 0
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct LoadingModal_Previews: PreviewProvider {
    static var previews: some View {
        LoadingModal()
    }
}
