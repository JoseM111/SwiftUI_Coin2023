import SwiftUI

struct AllCoinsView: View {
    @StateObject var homeViewModel: HomeViewModel
    
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
                    ForEach(homeViewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
//    @StateObject var homeViewModel: HomeViewModel
    
    static var previews: some View {
        AllCoinsView(homeViewModel: HomeViewModel())
    }
}
