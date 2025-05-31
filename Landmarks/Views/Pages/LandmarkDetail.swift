//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/22/25.
//

import SwiftUI

struct LandmarkDetail: View {
    let landmark: Landmark
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(location: landmark.location)
                    .frame(height: 300)
                
                AvatarImageView(image: landmark.image)
                    .offset(y:-150)
                    .padding(.bottom, -160)
                
                HeaderView(landmark: landmark)
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
