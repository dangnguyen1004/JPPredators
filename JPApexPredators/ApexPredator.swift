//
//  Untitled.swift
//  JPApexPredators
//
//  Created by Dang Nguyen on 5/4/26.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MoviveScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}

struct MoviveScene: Decodable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: APType {
        self
    }
    
    var background: Color {
        switch self {
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        case .all:
                .black
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .air:
            "wind"
        case .land:
            "leaf.fill"
        case .sea:
            "drop.fill"
        }
    }
}
