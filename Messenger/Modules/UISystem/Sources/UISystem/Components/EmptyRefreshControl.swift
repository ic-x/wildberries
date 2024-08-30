//
//  EmptyRefreshControl.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct EmptyRefreshControl: View {
    var coordinateSpaceName: String
    var onRefresh: () -> Void
    
    @State private var needRefresh: Bool = false
    
    public init(coordinateSpaceName: String, onRefresh: @escaping () -> Void) {
        self.coordinateSpaceName = coordinateSpaceName
        self.onRefresh = onRefresh
    }
    
    public var body: some View {
        GeometryReader { geo in
            if geo.frame(in: .named(coordinateSpaceName)).midY > 50 {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if geo.frame(in: .named(coordinateSpaceName)).maxY < 10 {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
        }
        .frame(height: 0)
    }
}

#Preview {
    EmptyRefreshControl(coordinateSpaceName: "exampleSpace") {
        print("Refreshed!")
    }
}
