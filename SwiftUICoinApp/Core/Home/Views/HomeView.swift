//
//  HomeView.swift
//  SwiftUICoinApp
//
//  Created by Jose Martinez on 3/18/23.
//

import SwiftUI

struct HomeView: View {
    ///∆ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    ///  • In your code, you've created an instance of    HomeViewModel using @StateObject, which indicates that this instance should be managed by SwiftUI, and it will persist across view updates. The views depending on this instance will be automatically updated when any of its @Published properties change.
    ///  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // top movers VIEW
                TopMoversView()
                
                // vertical divider
                Divider()
                
                // all coins VIEW
                AllCoinsView(homeViewModel: homeViewModel)
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
