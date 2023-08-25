//
//  RESTService.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import Foundation

/// Le service REST qui retourne les pays
actor CountriesService {
    
    /// le url  est injectable pour favoriser les tests unitaires
    let endpoint: String

    init(endpoint: String = "https://restcountries.com/v3.1/all?fields=cca3,name,flags,continents,population,capital") {
        self.endpoint = endpoint
    }

    /// Appel web pour obtenir la liste des pays depuis le serveur
    func loadCountries() async -> [CountryViewModel]? {
        guard let url = URL(string: endpoint) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([RestCountries.Country].self, from: data)
            return decodedResponse.map { country in
                CountryViewModel(country: country)
            }.sorted { $0.name < $1.name }
        } catch {
            return nil
        }
    }
}
