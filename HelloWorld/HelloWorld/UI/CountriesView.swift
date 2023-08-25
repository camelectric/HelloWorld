//
//  ContentView.swift
//  HelloWorld
//
//  Created by Philippe Landry on 2023-08-23.
//

import SwiftUI

struct CountriesView: View {
    @ObservedObject var viewModel = CountriesViewModel()
    @State var showAlert = false
    var body: some View {
        NavigationView {
            Form {
                List(viewModel.countries ?? [], id: \.uid) { item in
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
                                .shadow(radius: 5)
                                Text(item.name).font(.headline)
                            }
                        }
                    }
            }
            .navigationTitle(LocalizedStringKey("navigation_title"))
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.reload()
            }
            .onChange(of: viewModel.error,
                      perform: { value in
                showAlert = value != nil
            })
            .alert(viewModel.error?.description ?? "", isPresented: $showAlert) {
                ErrorView(viewModel: viewModel)
            }
        }
    }

}

struct ErrorView: View {
    @ObservedObject var viewModel: CountriesViewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.red)
            .overlay {
                VStack {
                    Text(CountriesError.failedLoading.description)
                        .font(.largeTitle)
                        .foregroundColor(.white)

                    Button(LocalizedStringKey("error_view_retry")) {
                        Task {
                            await viewModel.reload()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
