//
//  Model.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import Foundation

/// Namespace RectCountries
enum RestCountries {
    
    /// Objet Country retourné par le serveur
    struct Country: Codable {
        let cca3: String
        let name: Name
        let flags: Flags
        let capital: [String]
        let population: UInt
        let continents: [String]
    }

    /// Le nom d'un pays retourné par le serveur
    struct Name: Codable {
        let common: String
    }

    /// Le drapeau d'un pays retourné par le serveur
    struct Flags: Codable {
        let png: String
    }
}
