//
//  Profile.swift
//  Landmarks
//
//  Created by Danish Phiroz on 6/21/25.
//

import Foundation

struct Profile {
    let userName: String
    var prefersNotifications = false
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default`: Profile = .init(userName: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
