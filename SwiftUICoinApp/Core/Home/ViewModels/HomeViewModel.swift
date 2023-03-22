//
//  HomeViewModel.swift
//  SwiftUICoinApp
//
//  Created by Jose Martinez on 3/21/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    
    init() {
        // will fetch our data whenever a new object of the HomeViewModel is created
        fecthCoinData()
    }
    
    func fecthCoinData() -> Void {
        // Define a constant for the URL string
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let urlComponent = URLComponents(string: urlString),
              let url = urlComponent.url
        else {
            print("DEBUG: Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(".* DEBUG: Error \(error.localizedDescription)")
                return // return out of the program if there is an error
            }
            
            // Check the response status code
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
            
            // Safely unwrap the received data
            guard let data = data else {
                print("DEBUG: No data received")
                return
            }
            
            do {
                let coinsData = try JSONDecoder().decode([Coin].self, from: data)
                // print("DEBUG: Coins \(coinsData)")
                self.coins = coinsData
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }
        
        // resumes the task if its suspended
        task.resume()
    }
    
}
