//
//  ModelData.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/22/25.
//

import Foundation

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData")
    var hikes: [Hike] = load("hikeData")
}
