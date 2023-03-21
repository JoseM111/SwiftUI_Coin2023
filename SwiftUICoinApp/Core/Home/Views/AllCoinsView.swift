import SwiftUI

struct AllCoinsView: View {
    var body: some View {
        // header
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack {
                // t:coin
                Text("Coin")
                
                Spacer()
                // t:price
                Text("Price")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            // vertical scroll
            ScrollView {
                VStack {
                    ForEach(0..<50, id: \.self) { _ in
                        CoinRowView()
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
    }
}
