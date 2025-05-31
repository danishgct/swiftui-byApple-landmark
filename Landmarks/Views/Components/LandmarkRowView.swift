//
//  LandmarkRowView.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/22/25.
//

import SwiftUI

struct LandmarkRowView: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("White") {
    LandmarkRowView(landmark: ModelData().landmarks[0])
}

#Preview("Dark") {
    LandmarkRowView(landmark: ModelData().landmarks[0])
        .preferredColorScheme(.dark)
}
