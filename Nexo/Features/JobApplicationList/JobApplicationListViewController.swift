//
//  JobApplicationListViewController.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationListViewController: UIViewController {
    
    private let containerStackView = UIStackView()
    
    private let summaryView = JobApplicationSummaryView()
    private let actionSummaryBar = ActionSummaryBarView()
    private let tableView = UITableView()

    private let repository = JobApplicationRepository.shared
    private var applications: [JobApplication] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Başvurular"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped)
        )
        setupLayout()
        setupTableView()
        
        repository.loadSampleDataIfNeeded()
        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    private func setupLayout() {
        containerStackView.axis = .vertical
        containerStackView.spacing = 0
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        actionSummaryBar.translatesAutoresizingMaskIntoConstraints = false
        actionSummaryBar.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        view.addSubview(containerStackView)

        containerStackView.addArrangedSubview(summaryView)
        containerStackView.addArrangedSubview(actionSummaryBar)
        containerStackView.addArrangedSubview(tableView)
                
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(JobApplicationCell.self, forCellReuseIdentifier: JobApplicationCell.reuseIdentifier)
    }
    
    private func reloadData() {
        applications = repository.getAll()
        tableView.reloadData()
        let counts = calculateStatusCounts()
        summaryView.configure(with: counts)
    }
    
    @objc private func addButtonTapped() {
        let addVC = AddJobApplicationViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    private func calculateStatusCounts() -> [ApplicationStatus: Int] {
        var counts: [ApplicationStatus: Int] = [
            .applied: 0,
            .interview: 0,
            .offer: 0,
            .rejected: 0
        ]
        
        for application in applications {
            counts[application.status, default: 0] += 1
        }
        
        return counts
    }
}

extension JobApplicationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        applications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JobApplicationCell.reuseIdentifier, for: indexPath) as? JobApplicationCell else {
            return UITableViewCell()
        }
        
        let application = applications[indexPath.row]
        cell.configure(with: application)
        
        return cell
    }
}

extension JobApplicationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedApplication = applications[indexPath.row]
        let detailVC = JobApplicationDetailViewController(application: selectedApplication)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
