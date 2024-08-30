//
//  Image+.swift
//

import SwiftUI

public enum SocialMediaIcon: String {
    case facebook = "FacebookIcon"
    case instagram = "InstagramIcon"
    case linkedIn = "LinkedInIcon"
    case twitter = "TwitterIcon"
}

public enum TabViewIcon: String {
    case activeChats = "ActiveChatsIcon"
    case activeContact = "ActiveContactIcon"
    case activeMore = "ActiveMoreIcon"
    case chats = "ChatsIcon"
    case contact = "ContactIcon"
    case more = "MoreIcon"
}

public enum ToolbarIcon: String {
    case chevronLeft = "ChevronLeft"
    case composeMessage = "ComposeMessageIcon"
    case edit = "EditIcon"
    case newContact = "NewContactIcon"
    case readAll = "ReadAllIcon"
    case search = "SearchIcon"
}

public enum ImageAsset: String {
    case changeAvatar = "ChangeAvatar"
    case illustration = "Illustration"
}

public extension Image {
    init(socialMedia: SocialMediaIcon) {
        self.init(socialMedia.rawValue, bundle: .module)
    }

    init(tabView: TabViewIcon) {
        self.init(tabView.rawValue, bundle: .module)
    }

    init(toolbar: ToolbarIcon) {
        self.init(toolbar.rawValue, bundle: .module)
    }

    init(image: ImageAsset) {
        self.init(image.rawValue, bundle: .module)
    }
}
