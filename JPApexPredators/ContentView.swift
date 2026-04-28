//
//  ContentView.swift
//  JPApexPredators
//
//  Created by Dang Nguyen on 5/4/26.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText: String = ""
    @State var alphabetical: Bool = false
    @State var currentType: APType = .all
    
    var filteredDinos: [ApexPredator] {
        predators.filter(by: currentType)
        predators.sort(for: alphabetical)
        return predators.search(for: searchText)
    }

    var body: some View {
        NavigationStack {
            List(filteredDinos) { predator in
                NavigationLink {
                    PredatorDetail(predator: predator)
                } label: {
                    HStack {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 2)
                        VStack(alignment: .leading) {
                            Text(predator.name)
                                .fontWeight(.bold)
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        withAnimation(.bouncy, {
                            alphabetical.toggle()
                        })
                    }, label: {
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    })
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Menu{
                        Picker("Filters", selection: $currentType) {
                            ForEach(APType.allCases) {type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                })
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
