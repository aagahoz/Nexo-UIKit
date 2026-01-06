//
//  JobApplicationListViewController.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationListViewController: UIViewController {
    
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
        
        setupTableView()
        repository.loadSampleDataIfNeeded()
        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
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
    
    private func reloadData() {
        applications = repository.getAll()
        tableView.reloadData()
    }
    
    @objc private func addButtonTapped() {
        let addVC = AddJobApplicationViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }
    
}

extension JobApplicationListViewController: UITableViewDataSource {
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

extension JobApplicationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedApplication = applications[indexPath.row]
        let detailVC = JobApplicationDetailViewController(application: selectedApplication)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
