//
//  HomeView.swift
//  SwiftUICoinApp
//
//  Created by Jose Martinez on 3/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                // top movers VIEW
                TopMoversView()
                
                // all coins VIEW
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
