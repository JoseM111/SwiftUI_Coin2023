import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Mover")
                .font(.headline)
            
            // scroll view
            ScrollView(.horizontal) {
                // horizontal scroll HSTACK
                HStack(spacing: 16) {
                    ForEach(0..<5, id: \.self) { _ in
                        TopMoversItemView()
                    }
                }
            }
        }
        .padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
