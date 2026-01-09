//
//  JobApplicationListViewModel.swift
//  Nexo
//
//  Created by Agah Ozdemir on 9.01.2026.
//

import Foundation

final class JobApplicationListViewModel {
    
    private let repository: JobApplicationRepository
    
    private(set) var applications: [JobApplication] = []
    
    init(repository: JobApplicationRepository = .shared) {
        self.repository = repository
        self.repository.loadSampleDataIfNeeded()
    }
    
    func load() {
        applications = repository.getAll()
    }
    
    func delete(at index: Int) {
        let application = applications[index]
        repository.delete(application)
        load()
    }
    
    func statusCounts() -> [ApplicationStatus: Int] {
        var counts: [ApplicationStatus: Int] = [:]
        for app in applications {
            counts[app.status, default: 0] += 1
        }
        return counts
    }
}
