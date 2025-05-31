//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/22/25.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly: Bool = false
    
    @Environment(ModelData.self) private var modelData
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { $0.isFavorite || !showFavoritesOnly }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview("White") {
    LandmarkList()
        .preferredColorScheme(.light)
        .environment(ModelData())
}

#Preview("Dark") {
    LandmarkList()
        .preferredColorScheme(.dark)
        .environment(ModelData())
}
