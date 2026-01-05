//
//  JobApplicationListViewController.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationListViewController: UIViewController {
    
    private let tableView = UITableView()
    private var applications: [JobApplication] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Başvurular"
        
        setupTableView()
        loadDummyData()
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadDummyData() {
        
        let app = JobApplication(id: UUID(), companyName: "ABC Teknoloji", positionTitle: "iOS Developer", platform: "LinkedIn", applicationDate: Date(), status: .applied, contacts: [], steps: [], deadlines: [])
        
        applications = [app]
        tableView.reloadData()
    }
    
}

extension JobApplicationListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        applications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let application = applications[indexPath.row]
        
        cell.textLabel?.text = application.companyName
        cell.detailTextLabel?.text = application.positionTitle
        
        return cell
    }
}
