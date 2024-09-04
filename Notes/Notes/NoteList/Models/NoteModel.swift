//
//  NoteModel.swift
//  Notes
//
//  Created by Louise Hogan on 7/31/24.
//

import Foundation

struct NoteModel: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var lastModified: Date
}
