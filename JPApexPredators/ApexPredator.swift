//
//  Untitled.swift
//  JPApexPredators
//
//  Created by Dang Nguyen on 5/4/26.
//

struct ApexPredator: Decodable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longtitude: Double
    let movies: [String]
    let movieScenes: [MoviveScene]
    let link: String
}

struct MoviveScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
}
