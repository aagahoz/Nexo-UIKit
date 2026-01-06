//
//  HelperFunctions.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import Foundation

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}
