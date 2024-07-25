//
//  CustomTabItem.swift
//

import SwiftUI

public struct CustomTabItem {
    public let icon: Image
    public let activeIcon: Image
    public let view: AnyView
    
    public init(icon: Image, activeIcon: Image, view: AnyView) {
        self.icon = icon
        self.activeIcon = activeIcon
        self.view = view
    }
}
