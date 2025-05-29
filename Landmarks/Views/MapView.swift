//
//  MapView.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/21/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    let location: CLLocationCoordinate2D
    
    @State private var cameraPosition: MapCameraPosition
    
    init(location: CLLocationCoordinate2D) {
        self.location = location
        _cameraPosition = State(initialValue: MapCameraPosition.region(
            MKCoordinateRegion(
                center: location,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        ))
    }
    
    var body: some View {
        Map(position: $cameraPosition)
    }
}

#Preview {
    MapView(location: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
