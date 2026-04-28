//
//  Predators.swift
//  JPApexPredators
//
//  Created by Dang Nguyen on 18/4/26.
//

import Foundation

class Predators {
    var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("Decode error \(error)")
            }
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter({ $0.name.lowercased().contains(searchTerm.lowercased()) })
        }
    }
    
    func sort(for alphabetical: Bool) {
        apexPredators.sort(by: { a, b in
            if alphabetical {
                return a.name.localizedCaseInsensitiveCompare(b.name) == .orderedAscending
            } else {
                return a.id < b.id
            }
        })
    }
    
    func filter(by type: APType) {
        if (type == .all) {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter { $0.type == type }
        }
    }
}
