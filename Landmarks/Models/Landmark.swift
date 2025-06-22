//
//  Landmark.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/22/25.
//

import Foundation
import CoreLocation
import SwiftUI

struct Landmark: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let isFeatured: Bool
    var isFavorite: Bool //Mutable property to update the Favorite status
    let park: String
    let state: String
    let description: String
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private let imageName: String
    var image:Image {
        Image(imageName)
    }
    
    private let coordinates: Coordinates
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: CLLocationDegrees(coordinates.latitude),
            longitude: CLLocationDegrees(coordinates.longitude)
        )
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
}
