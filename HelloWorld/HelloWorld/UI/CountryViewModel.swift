//
//  CountryViewModel.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-24.
//

import Foundation

struct CountryViewModel {
    let uid: String
    let name: String
    let flagURL: URL?
    let capital: String
    let population: String
    let continent: String

    init(country: RestCountries.Country) {
        uid = country.cca3
        name = country.name.common
        flagURL = URL(string: country.flags.png)
        capital = country.capital.first ?? "unknown"
        population = country.population.formatted()
        continent = country.continents.first ?? "unknown"
    }
}
