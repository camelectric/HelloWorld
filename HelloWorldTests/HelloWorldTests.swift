//
//  HelloWorldTests.swift
//  HelloWorldTests
//
//  Created by Philippe Landry on 2023-08-23.
//

import XCTest
@testable import HelloWorld

final class HelloWorldTests: XCTestCase {

    func test_service_and_view_model() async throws {
        let endpoint = try XCTUnwrap(
            Bundle(for: HelloWorldTests.self)
                .url(forResource: "restcountries", withExtension: "json")
            )
        let service = CountriesService(endpoint: endpoint.absoluteString)
        let countries = await service.loadData()
        XCTAssertEqual(countries.count, 250)

        let first = try XCTUnwrap(countries[1])
        XCTAssertEqual(first.uid, "ALB")
        XCTAssertEqual(first.name, "Albania")
        XCTAssertEqual(first.flagURL, URL(string: "https://flagcdn.com/w320/al.png"))
        XCTAssertEqual(first.capital, "Tirana")
        XCTAssertEqual(
            first.population.components(
                separatedBy: CharacterSet.decimalDigits.inverted
            ).joined(),
            "2837743"
        )
    }
}
