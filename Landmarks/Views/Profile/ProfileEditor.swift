//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Clark Adams on 7/15/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.backgroundGradient) var backgroundGradient
    
    @Binding var profile: Profile
    
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea(.all)
            
            VStack() {
                Text("Profile Info")
                    .font(.headline)
                    .padding()
                
                TextField("Username", text: $profile.username)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(backgroundGradient).shadow(radius: 15))
                    .frame(maxWidth: 250)
                
                HStack {
                    Toggle(isOn: $profile.prefersNotifications) {
                        Text("Enable Notifications")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .pink))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 32).fill(backgroundGradient).shadow(radius: 32))
                    
                    VStack {
                        Text("Goal Date")
                        DatePicker("Goal Date", selection: $profile.goalDate, displayedComponents: .date)
                            .labelsHidden()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 32).fill(backgroundGradient).shadow(radius: 32))
                }
                .padding(.vertical)
                .frame(maxWidth: 350)
                
                VStack(spacing: 10) {
                    Text("Seasonal Photo")
                    Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                        ForEach(Profile.Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 32).fill(backgroundGradient).shadow(radius: 32))
                .frame(maxWidth: 260)
            }
            .padding()
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default))
        .environment(ModelData())
}
