//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.backgroundGradient) var backgroundGradient
    
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.pink, .blue],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.vertical)
                
                Text(profile.username)
                    .bold()
                    .font(.title)
            }
            .padding(.vertical)
            
            VStack {
                Text("Notifications: \(profile.prefersNotifications ? "on" : "off")")
                    .padding(.bottom)
                Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
                    .padding(.bottom)
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
            .padding(.bottom)
            
            Divider()
            
            VStack {
                Text("Complted Badges")
                    .font(.headline)
                ScrollView(.horizontal) {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.2)
                            .hueRotation(Angle(degrees: 45))
                        HikeBadge(name: "Mountain Explorer")
                            .hueRotation(Angle(degrees: 30))
                        HikeBadge(name: "Nature Lover")
                            .grayscale(0.2)
                            .hueRotation(Angle(degrees: 60))
                        HikeBadge(name: "Marathoner")
                            .hueRotation(Angle(degrees: 135))
                    }
                    .padding([.bottom, .horizontal])
                }
            }
            
            Divider()
        }
        .background(
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    ProfileSummary(profile: .default)
        .environment(ModelData())
}
