//
//  RESTService.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import Foundation

actor CountriesService {
    let endpoint: String

    init(endpoint: String = "https://restcountries.com/v3.1/all?fields=cca3,name,flags,continents,population,capital") {
        self.endpoint = endpoint
    }

    func loadData() async -> [CountryViewModel] {
        guard let url = URL(string: endpoint) else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([RestCountries.Country].self, from: data)
            return decodedResponse.map { country in
                CountryViewModel(country: country)
            }.sorted { $0.name < $1.name }
        } catch {
            return []
        }
    }
}
