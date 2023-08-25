//
//  CountryView.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import SwiftUI

struct CountryView: View {
    let viewModel: CountryViewModel
    var body: some View {
        Form {
            Section {
                Text(viewModel.name).font(.largeTitle).frame(maxWidth: .infinity, alignment: .center)
            }
            Section {
                AsyncImage(url: viewModel.flagURL,
                           content: { image in
                        image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 5)
                },
                           placeholder: {
                    ProgressView().progressViewStyle(.circular)
                }
                )
            }
            Section(
                LocalizedStringKey("section_continent")
            ) {                   Text(viewModel.continent).font(.headline)
            }
            Section(
                LocalizedStringKey("section_population")
            ) {                   Text(viewModel.population).font(.headline)
            }
            Section(LocalizedStringKey("section_capital")) {                   Text(viewModel.capital).font(.headline)
            }
        }
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(
            viewModel: CountryViewModel(country: RestCountries.Country.stub)
        )
    }
}
