//
//  Item.swift
//  EmojiFlow
//
//  Created by Clark Adams on 7/11/24.
//

import SwiftUI

struct Item: Identifiable {
    let id: UUID
    let view: AnyView
    let emoji: String
}
