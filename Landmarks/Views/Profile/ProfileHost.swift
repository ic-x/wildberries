//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.backgroundGradient) var backgroundGradient
    
    @State private var profile: Profile = Profile.default
    @State private var draftProfile: Profile = Profile.default
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            switch isEditing {
            case true:
                ProfileEditor(profile: $draftProfile)
                    .navigationTitle("Edit Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                isEditing = false
                            }) {
                                Image(systemName: "chevron.backward")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") {
                                profile = draftProfile
                                isEditing = false
                            }
                        }
                    }
            default:
                ProfileSummary(profile: profile)
                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Edit") {
                                draftProfile = profile
                                isEditing = true
                            }
                        }
                    }
            }
        }
        .background(
            backgroundGradient
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
