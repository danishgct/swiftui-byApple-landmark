//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by Danish Phiroz on 5/29/25.
//

import CoreGraphics

// This file defines the parameters needed to draw a hexagon shape with curved edges.
// It is used in the SwiftUI drawing system to define the points for drawing a path.

struct HexagonParameters {
    // Nested struct representing a segment of the hexagon.
    // Each segment consists of:
    // - a straight line endpoint
    // - a curve endpoint
    // - a control point for the Bézier curve between the line and curve points
    struct Segment {
        let line: CGPoint      // Endpoint of the straight line
        let curve: CGPoint     // Endpoint of the Bézier curve
        let control: CGPoint   // Control point for the Bézier curve
    }
    
    // Adjustment factor applied to y-values to slightly smooth the hexagon shape.
    static let adjustment: CGFloat = 0.085
    
    // Array of six segments defining the full hexagon.
    // The points are specified in normalized coordinates (0.0 to 1.0)
    static let segments: [Segment] = [
        // Top segment
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        // Upper-left segment
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        // Lower-left segment
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        // Bottom segment
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        // Lower-right segment
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        // Upper-right segment
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
