//
//  HikeGraph.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/31/25.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
                    .speed(2)
                    .delay(0.03 * Double(index))
    }
}

struct HikeGraph: View {
    var hike: Hike
    // KeyPath to select which Range<Double> metric (e.g., elevation, heart rate, pace) to plot
    var path: KeyPath<Hike.Observation, Range<Double>>
    
    //Color for path
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    //MARK: - View
    
    var body: some View {
        let data = hike.observations
        //Overall Range
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))
        
        GeometryReader { proxy in
            HStack(alignment: .center, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(index: index,
                                 color: color,
                                 height: proxy.size.height,
                                 range: observation[keyPath: path],
                                 overallRange: overallRange)
                    .animation(.ripple(index: index))
                }
            }
        }
    }
    
    //MARK: - Private Functions
    //Function to return range of range
    func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double> where C.Element == Range<Double> {
        guard !ranges.isEmpty else { return 0..<0 }
        let low = ranges.lazy.map { $0.lowerBound }.min() ?? 0
        let high = ranges.lazy.map { $0.upperBound }.max() ?? 0
        return low..<high
    }
    
    /// Returns the length of a numeric range.
    func magnitude(of range: Range<Double>) -> Double { range.upperBound - range.lowerBound }
}

#Preview {
    let hike = ModelData().hikes[0]
    Group {
        HikeGraph(hike: hike, path: \.elevation)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.heartRate)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.pace)
            .frame(height: 200)
    }
}
