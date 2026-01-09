//
//  JobApplicationRepository.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import Foundation

final class JobApplicationRepository {
    
    static let shared = JobApplicationRepository()
    
    private init() {}
    
    private var applications: [JobApplication] = []
    
    func getAll() -> [JobApplication] {
        applications
    }
    
    func add(_ application: JobApplication) {
        applications.append(application)
    }
    
    func delete(_ application: JobApplication) {
        applications.removeAll { $0.id == application.id }
    }
    
    func loadSampleDataIfNeeded() {
        guard applications.isEmpty else { return }

        let companies = [
            "ABC Teknoloji",
            "Nova Yazılım",
            "BlueTech",
            "InnovaSoft",
            "NextGen Labs",
            "Cloudify",
            "PixelWorks",
            "CodeNest",
            "DataFlow",
            "AppForge"
        ]

        let positions = [
            "iOS Developer",
            "Junior iOS Developer",
            "Mobile Software Engineer",
            "Frontend Developer",
            "Software Engineer"
        ]

        let platforms = [
            "LinkedIn",
            "Kariyer.net",
            "Indeed",
            "Şirket Sitesi"
        ]

        let statuses: [ApplicationStatus] = [
            .prospect,
//            .applied,
            .interview,
            .offer,
            .rejected
        ]

        for _ in 0..<20 {
            let randomCompany = companies.randomElement()!
            let randomPosition = positions.randomElement()!
            let randomPlatform = platforms.randomElement()!
            let randomStatus = statuses.randomElement()!

            let randomDaysAgo = Int.random(in: 1...60)
            let randomDate = Calendar.current.date(
                byAdding: .day,
                value: -randomDaysAgo,
                to: Date()
            ) ?? Date()

            let application = JobApplication(
                id: UUID(),
                companyName: randomCompany,
                positionTitle: randomPosition,
                platform: randomPlatform,
                applicationDate: randomDate,
                status: randomStatus,
                contacts: [],
                steps: [],
                deadlines: []
            )

            applications.append(application)
        }
    }
    
}
