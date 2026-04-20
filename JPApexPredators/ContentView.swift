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
    
    var filteredDinos: [ApexPredator] {
        predators.sort(for: alphabetical)
        return predators.search(for: searchText)
    }

    var body: some View {
        NavigationStack {
            List(filteredDinos) { predator in
                NavigationLink {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
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
                    })
                })
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
