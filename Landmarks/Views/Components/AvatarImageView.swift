//
//  AvatarImageView.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/21/25.
//

import SwiftUI

struct AvatarImageView: View {
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .padding()
    }
}

#Preview {
    AvatarImageView(image: Image("turtlerock"))
}
