//
//  CountriesViewModel.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-24.
//

import Foundation

class CountriesViewModel: ObservableObject {
    @Published var countries: [CountryViewModel]?
    @Published var error: CountriesError?
    private let service: CountriesService
    init( service: CountriesService = CountriesService()) {
        self.service = service
    }

    func reload() async {
        error = nil
        countries = await service.loadCountries()
        if countries == nil {
            error = .failedLoading
        }
    }
}

enum CountriesError: Error {
    case failedLoading

    var description: String {
        switch self {
        case .failedLoading:
            return NSLocalizedString("error_view_message", comment: "")
        }
    }
}
