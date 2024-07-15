//
//  RandomLayoutView.swift
//  EmojiFlow
//
//  Created by Clark Adams on 7/11/24.
//

import SwiftUI

struct RandomLayoutView: View {
    
    private let randomWidth90: CGFloat = 90 + CGFloat.random(in: -20...20)
    private let randomHeight100: CGFloat = 100 + CGFloat.random(in: -20...20)
    private let randomWidth150: CGFloat = 150 + CGFloat.random(in: -20...20)
    
    var body: some View {
        randomLayout
            .frame(width: 300, height: 200)
    }
    
    @ViewBuilder private var randomLayout: some View {
        switch Int.random(in: 0..<4) {
        case 0:
            HStack {
                RectangleView(color: .blue)
                    .frame(width: randomWidth90)
                VStack {
                    RectangleView(color: .gray)
                        .frame(height: randomHeight100)
                    RectangleView(color: .gray)
                }
            }
        case 1:
            VStack {
                RectangleView(color: .blue)
                    .frame(height: randomHeight100)
                HStack {
                    RectangleView(color: .gray)
                        .frame(width: randomWidth150)
                    RectangleView(color: .gray)
                }
            }
        case 2:
            HStack {
                VStack {
                    RectangleView(color: .gray)
                        .frame(height: randomHeight100)
                    RectangleView(color: .gray)
                }
                RectangleView(color: .blue)
                    .frame(width: randomWidth90)
            }
        default:
            VStack {
                HStack {
                    RectangleView(color: .gray)
                        .frame(width: randomWidth150)
                    RectangleView(color: .gray)
                }
                RectangleView(color: .blue)
                    .frame(height: randomHeight100)
            }
        }
    }
}

#Preview {
    RandomLayoutView()
}
