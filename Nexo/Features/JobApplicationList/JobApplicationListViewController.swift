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
    
    private let viewModel = JobApplicationListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Başvurular"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped)
        )
        setupLayout()
        setupTableView()
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
        
        containerStackView.setCustomSpacing(12, after: summaryView)
        containerStackView.setCustomSpacing(12, after: actionSummaryBar)
                
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
        viewModel.load()
        tableView.reloadData()
        summaryView.configure(with: viewModel.statusCounts())
    }
    
    @objc private func addButtonTapped() {
        let addVC = AddJobApplicationViewController()
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    private func presentDeleteConfirmation(at indexPath: IndexPath) {
        
        let application = viewModel.applications[indexPath.row]
        
        let alert = UIAlertController(title: "Başvuruyu Sil", message: "\(application.companyName) başvurusu silinsin mi?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "İptal", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Sil", style: .destructive) { [weak self] _ in
            self?.deleteApplication(at: indexPath.row)
        })
        
        present(alert, animated: true)
    }
    
    private func deleteApplication(at index: Int) {
        viewModel.delete(at: index)
        reloadData()
    }
}

extension JobApplicationListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.applications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JobApplicationCell.reuseIdentifier, for: indexPath) as? JobApplicationCell else {
            return UITableViewCell()
        }
        
        let application = viewModel.applications[indexPath.row]
        cell.configure(with: application)
        
        return cell
    }
}

extension JobApplicationListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedApplication = viewModel.applications[indexPath.row]
        let detailVC = JobApplicationDetailViewController(application: selectedApplication)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { [weak self] _, _, completion in
                
            self?.presentDeleteConfirmation(at: indexPath)
            completion(true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
