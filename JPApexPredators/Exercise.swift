//
//  Exercise.swift
//  JPApexPredators
//
//  Created by Dang Nguyen on 1/5/26.
//

import Foundation

class SortAndFilterExercise {
    func sortAndFilter(_ stringArray: [String]) -> [String] {
        // your code here
        return stringArray
            .filter { !["a", "e", "i", "o", "u"].contains($0.first?.lowercased() ?? " ") }
            .sorted { $0.lowercased() > $1.lowercased() }
    }
}
