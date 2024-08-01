//
//  Font+.swift
//

import SwiftUI

extension Font {
    // Heading fonts
    public static let heading1 = Font.custom("SFProDisplay-Bold", size: 32)
    public static let heading2 = Font.custom("SFProDisplay-Bold", size: 24)
    
    // Subheading fonts
    public static let subheading1 = Font.custom("SFProDisplay-SemiBold", size: 18)
    public static let boldSubheading1 = Font.custom("SFProDisplay-Bold", size: 18)
    public static let subheading2 = Font.custom("SFProDisplay-SemiBold", size: 16)
    
    // Body text fonts
    public static let body1 = Font.custom("SFProDisplay-SemiBold", size: 14)
    public static let body2 = Font.custom("SFProDisplay-Regular", size: 14)
    
    // Metadata fonts
    public static let metadata1 = Font.custom("SFProDisplay-Regular", size: 12)
    public static let metadata2 = Font.custom("SFProDisplay-Regular", size: 10)
    public static let metadata3 = Font.custom("SFProDisplay-SemiBold", size: 10)
    
    // Other fonts
    public static let phone = Font.custom("SFProDisplay-Regular", size: 16)
    public static let welcomeTitle = Font.custom("SFProDisplay-Regular", size: 40)
    public static let welcomeText = Font.custom("SFProDisplay-Regular", size: 20)
}
