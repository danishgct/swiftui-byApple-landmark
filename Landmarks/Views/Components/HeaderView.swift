//
//  HeaderView.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/21/25.
//

import SwiftUI

struct HeaderView: View {
    @Environment(ModelData.self) var modelData
    
    let landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        VStack(alignment:.leading) {
            HStack {
                Text(landmark.name)
                    .font(.title)
                
                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            }
            
            HStack {
                Text(landmark.park)
                    .font(.subheadline)
                
                Spacer()
                
                Text(landmark.state)
                    .font(.subheadline)
            }
            
            Divider()
            
            Text("About \(landmark.name)")
                .font(.title2)
                            
            Text(landmark.description)
        }
        .padding()
    }
}

#Preview {
    HeaderView(landmark: ModelData().landmarks[0])
        .environment(ModelData())
}
