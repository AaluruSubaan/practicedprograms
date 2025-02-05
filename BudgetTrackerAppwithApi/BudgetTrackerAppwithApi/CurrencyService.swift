//
//  CurrencyService.swift
//  BudgetTrackerAppwithApi
//
//  Created by admin on 05/02/25.
//

import Foundation
import Combine

struct ExchangeRateResponse: Codable {
    let rates: [String: Double]
}
class CurrencyService {
    static let shared = CurrencyService()
    
    private var cancellable = Set<AnyCancellable>()
    func fetchExchangeRates(baseCurrency: String) -> AnyPublisher<[String: Double], Error>{
        let urlString = "https://open.er-api.com/v6/latest/\(baseCurrency)?apikey=88016a3759106e6f1c58d533"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ExchangeRateResponse.self, decoder: JSONDecoder())
            .map{ $0.rates}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

