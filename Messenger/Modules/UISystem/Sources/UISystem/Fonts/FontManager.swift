//
//  FontManager.swift
//

import SwiftUI

public struct FontManager {
    public static func registerFonts() {
        let fontNames = [
            "SF-Pro-Display-Bold",
            "SF-Pro-Display-SemiBold",
            "SF-Pro-Display-Regular"
        ]
        
        fontNames.forEach { fontName in
            guard let url = Bundle.module.url(forResource: fontName, withExtension: "otf"),
                  let fontDataProvider = CGDataProvider(url: url as CFURL),
                  let font = CGFont(fontDataProvider) else {
                return
            }
            CTFontManagerRegisterGraphicsFont(font, nil)
        }
    }
}
