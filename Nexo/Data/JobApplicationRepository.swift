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
    
    func loadSampleDataIfNeeded() {
        guard applications.isEmpty else { return }

        let app = JobApplication(
            id: UUID(),
            companyName: "ABC Teknoloji",
            positionTitle: "iOS Developer",
            platform: "LinkedIn",
            applicationDate: Date(),
            status: .interview,
            contacts: [],
            steps: [],
            deadlines: []
        )

        applications.append(app)
    }
    
}
