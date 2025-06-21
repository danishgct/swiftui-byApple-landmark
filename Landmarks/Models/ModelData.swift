//
//  ModelData.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/22/25.
//

import Foundation // Import the Foundation framework
import Playgrounds // Import the Playgrounds framework

// Generic function to load and decode a JSON file from the app bundle
func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data // Declare a variable to hold the data
    
    // Attempt to find the file in the main bundle
    guard let file = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        fatalError("Couldn't find \(fileName) in main bundle.") // Stop execution if file isn't found
    }
    
    do {
        data = try Data(contentsOf: file) // Try to load the file's contents as Data
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)") // Stop if loading fails
    }
    
    do {
        let decoder = JSONDecoder() // Create a JSON decoder
        return try decoder.decode(T.self, from: data) // Decode the data into the expected type
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)") // Stop if decoding fails
    }
}

@Observable // Mark ModelData as observable for SwiftUI
class ModelData {
    var landmarks: [Landmark] = load("landmarkData") // Load the landmark data into an array
    var hikes: [Hike] = load("hikeData") // Load the hike data into an array
    
    // Computed property to group landmarks by category
    var categories:[String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue }) // Group by the raw value of the category
    }
}

#Playground {
    let landmark = ModelData().landmarks[0] // Access the first landmark
    let categories = ModelData().categories // Access the grouped categories
}
