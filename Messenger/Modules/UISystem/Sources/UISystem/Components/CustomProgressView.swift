//
//  CustomProgressView.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct CustomProgressView: View {
    
    @State private var rotation: Double = 0
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color.brandAccentColor.opacity(0.3), lineWidth: 4)
                .frame(width: 40, height: 40)
            
            Circle()
                .trim(from: 0.0, to: 0.2)
                .stroke(AngularGradient(
                    gradient: Gradient(colors: [Color.brandAccentColor, Color.brandAccentColor.opacity(0.1)]),
                    center: .center
                ), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .frame(width: 40, height: 40)
                .rotationEffect(Angle(degrees: rotation))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: rotation)
                .onAppear {
                    rotation = 360
                }
                .shadow(color: .brandAccentColor, radius: 10)
                .shadow(color: .brandAccentColor.opacity(0.7), radius: 20)
        }
        .padding(40)
        .background(Color.clear)
        .drawingGroup()
    }
}

#Preview {
    CustomProgressView()
}
