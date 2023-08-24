//
//  ContentView.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import SwiftUI

struct CountriesView: View {
    @State private var countries = [CountryViewModel]()
    private var service = CountriesService()
    var body: some View {
        NavigationView {
            Form {
                List(countries, id: \.uid) { item in
                        NavigationLink {
                            CountryView(viewModel: item)
                        } label: {
                            HStack {
                                AsyncImage(
                                    url: item.flagURL!,
                                    content: { image in
                                        image.resizable()
                                             .aspectRatio(contentMode: .fit)
                                    },
                                    placeholder: {
                                        ProgressView().progressViewStyle(.circular)
                                    }
                                )
                                .frame(width: 40, height: 40)
                                Text(item.name).font(.headline)
                            }
                        }
                    }
            }
            .navigationTitle(LocalizedStringKey("navigation_title"))
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await countries = service.loadData()
            }
        }
    }

}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
