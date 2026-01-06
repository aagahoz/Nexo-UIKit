//
//  JobApplication.swift
//  Nexo
//
//  Created by Agah Ozdemir on 5.01.2026.
//

import UIKit

enum ApplicationStatus {
    case applied
    case interview
    case offer
    case rejected
}

extension ApplicationStatus {

    var displayTitle: String {
        switch self {
        case .applied:
            return "Başvuru"
        case .interview:
            return "Görüşme"
        case .offer:
            return "Teklif"
        case .rejected:
            return "Olumsuz"
        }
    }

    var accentColor: UIColor {
        switch self {
        case .applied:
            return .secondaryLabel
        case .interview:
            return .systemBlue
        case .offer:
            return .systemGreen
        case .rejected:
            return .systemRed
        }
    }

    var iconName: String {
        switch self {
        case .applied:
            return "paperplane"
        case .interview:
            return "person.crop.circle.badge.questionmark"
        case .offer:
            return "checkmark.seal"
        case .rejected:
            return "xmark.seal"
        }
    }
}

struct JobApplication {
    let id: UUID
    var companyName: String
    var positionTitle: String
    var platform: String
    var applicationDate: Date
    var status: ApplicationStatus
    var contacts: [Contact]
    var steps: [ApplicationStep]
    var deadlines: [Deadline]
}
