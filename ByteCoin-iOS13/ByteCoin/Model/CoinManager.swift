//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ currency: String, _ rate: Double)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "3B95FBE6-7AB2-471D-A17D-BCD660EB7AF0"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) {
        let urlStr = baseURL + "/" + currency + "?apikey=" + apiKey
        
        // 1. Create URL
        if let url = URL(string: urlStr) {
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            // 3. Give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                //Format the data we got back as a string to be able to print it.
                if let safeData = data {
                    if let rate = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePrice(currency, rate)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            print(decodedData.rate)
            return decodedData.rate
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }

}
