//
//  Deadline.swift
//  Nexo
//
//  Created by Agah Ozdemir on 5.01.2026.
//

import Foundation

struct Deadline {
    let id: UUID
    var title: String
    var dueDate: Date
    var isCompleted: Bool
    var note: String?
}
