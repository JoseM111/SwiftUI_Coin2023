//
//  HomeViewModel.swift
//  SwiftUICoinApp
//
//  Created by Jose Martinez on 3/21/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    init() {
        // will fetch our data whenever a new object of the HomeViewModel is created
        fecthCoinData()
    }
    
    func fecthCoinData() -> Void {
        let urlString = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h")
        
        guard let url = urlString else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(".* DEBUG: Error \(error.localizedDescription)")
                return // return out of the program if there is an error
            }
            
            if let response = response as? HTTPURLResponse {
                let statusMsg =
                response.statusCode == 200
                ? "\(response.statusCode): OK"
                : "\(response.statusCode): Error"
                
                print("""
                    DEBUG: Response code {
                        \(statusMsg)
                    },\n
                    """)
            }
            
            guard let data = data else { return }
            
            do {
                let coinsData = try JSONDecoder().decode([Coin].self, from: data)
                print("DEBUG: Coins \(coinsData)")
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }
        
        // resumes the task if its suspended
        task.resume()
    }
    
}
