//
//  Crypto-Model.swift
//  iCrypto
//
//  Created by Санжар Бахытбек on 23.05.2023.
//

import Foundation

struct Crypto: Decodable {
    let asset_id_base: String
    let rates: [Rate]
}

struct Rate: Decodable, Identifiable {
    let id = UUID()
    let time: String
    let asset_id_quote: String
    let rate: Double
    
    static var sampleRates: [Rate] {
        var tempRates = [Rate]()
        for _ in 1...20 {
            let randomNumber = Double(Array(0...1000).randomElement()!)
            let randomCurrency = ["BTC", "ETH", "LOL", "XRP"].randomElement()!
            
            let sampleRate = Rate(time: "00210301021", asset_id_quote: randomCurrency, rate: randomNumber)
            tempRates.insert(sampleRate, at: 0)
        }
        return tempRates
    }
}
