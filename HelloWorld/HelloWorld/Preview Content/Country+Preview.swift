//
//  Country+Preview.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-24.
//

import Foundation

extension RestCountries.Country {
    static var stub: RestCountries.Country {
        return RestCountries.Country(
            cca3: "qc",
            name: RestCountries.Name(common: "Québec"),
            flags: RestCountries.Flags(
                png:
                    "https://upload.wikimedia.org/wikipedia/commons/archive/0/0c/20091118074326%21Quebec_flag.png"
            ),
            capital: ["Québec"],
            population: 8_485_000,
            continents: ["Amérique du Nord"]
        )
    }
}
