//
//  APIManager.swift
//  iCrypto
//
//  Created by Санжар Бахытбек on 23.05.2023.
//

import Foundation

class CryptoAPI {
    // Get your API KEY here: https://www.coinapi.io/pricing?apikey
    let API_KEY = "6412D165-A401-475F-BED8-B3752F9B4C63"
    
    func getCryptoData(currency: String, previewMode: Bool, _ completion:@escaping ([Rate]) -> ()) {
        if previewMode {
            completion(Rate.sampleRates)
            return
        }
        
        let urlString = "https://rest.coinapi.io/v1/exchangerate/\(currency)?invert=false&apikey=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            print("CryptoAPI: Invalid URL")
            return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("CryptoAPI: Could not retrieve data...")
                return
            }
            
            do {
                let ratesData = try JSONDecoder().decode(Crypto.self, from: data)
                completion(ratesData.rates)
            } catch {
                print("CryptoAPI: \(error)")
                completion(Rate.sampleRates)
            }
        }
        .resume()
    }
}
