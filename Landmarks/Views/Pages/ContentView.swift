//
//  ContentView.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
