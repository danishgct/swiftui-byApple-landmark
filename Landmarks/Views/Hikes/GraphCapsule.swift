//
//  GraphCapsule.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/31/25.
//

import SwiftUI

struct GraphCapsule: View {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var body: some View {
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
    
    /// Returns the length of a numeric range.
    func magnitude(of range: Range<Double>) -> Double {
        return range.upperBound - range.lowerBound
    }
}

#Preview {
    GraphCapsule(index: 0,
                 color: .blue,
                 height: 150,
                 range: 10..<50,
                 overallRange: 0..<100)
}
