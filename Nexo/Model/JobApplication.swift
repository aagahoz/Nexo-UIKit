//
//  JobApplication.swift
//  Nexo
//
//  Created by Agah Ozdemir on 5.01.2026.
//

import Foundation

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
            return "Başvuruldu"
        case .interview:
            return "Görüşme"
        case .offer:
            return "Teklif"
        case .rejected:
            return "Olumsuz"
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
