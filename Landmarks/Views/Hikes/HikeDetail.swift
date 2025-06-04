//
//  HikeDetail.swift
//  Landmarks
//
//  Created by Danish Phiroz on 6/4/25.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dateToShow = \Hike.Observation.elevation
    
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]
    
    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dateToShow)
                .frame(height: 200)
            
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dateToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundStyle(value.1 == dateToShow ? .gray : .accentColor)
                            .animation(nil)
                    }

                }
            }
        }
    }
}

#Preview {
    HikeDetail(hike: ModelData().hikes[0])
}
