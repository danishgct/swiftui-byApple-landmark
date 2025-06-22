//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Danish Phiroz on 6/21/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("User Name")
                Spacer()
                TextField("Enter User Name", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable notifications")
            }
            
            Picker(selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue)
                        .tag(season)
                }
            } label: {
                Text("Seasonal Photo")
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
}
