//
//  BackgroundGradientKey.swift
//  Landmarks
//
//  Created by Clark Adams on 7/15/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct BackgroundGradientKey: EnvironmentKey {
    static let defaultValue: LinearGradient = LinearGradient(
        gradient: Gradient(colors: [Color.blue.opacity(0.05), Color.purple.opacity(0.05)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

extension EnvironmentValues {
    var backgroundGradient: LinearGradient {
        get { self[BackgroundGradientKey.self] }
        set { self[BackgroundGradientKey.self] = newValue }
    }
}
