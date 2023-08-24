//
//  Model.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import Foundation

enum RestCountries {
    struct Country: Codable {
        let cca3: String
        let name: Name
        let flags: Flags
        let capital: [String]
        let population: UInt
        let continents: [String]
    }

    struct Name: Codable {
        let common: String
    }

    struct Flags: Codable {
        let png: String
    }
}
