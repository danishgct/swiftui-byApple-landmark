//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/20/25.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
