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
