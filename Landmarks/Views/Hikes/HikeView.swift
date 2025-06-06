//
//  HikeView.swift
//  Landmarks
//
//  Created by Danish Phiroz on 6/4/25.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .scale.combined(with: .opacity))
    }
}

struct HikeView: View {
    let hike: Hike
    @State private var showDetails = true
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    withAnimation(.easeInOut(duration: 1)) {
                        showDetails.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetails ? 90 : 0))
                        .scaleEffect(showDetails ? 1.5 : 1.0)
                        .padding()
                }
            }
            
            Spacer()
            
            if showDetails {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
            
            Spacer()
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
