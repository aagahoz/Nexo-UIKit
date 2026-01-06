//
//  JobApplicationDetailViewController.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationDetailViewController: UIViewController {
    
    private let application: JobApplication
    
    private let positionLabel = UILabel()
    private let statusLabel = UILabel()
    private let dateLabel = UILabel()
    
    init(application: JobApplication) {
        self.application = application
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = application.companyName
            
        setupUI()
        configure()
    }
    
    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [
            positionLabel,
            statusLabel,
            dateLabel
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func configure() {
        positionLabel.text = application.positionTitle
        statusLabel.text = "Durum: \(application.status.displayTitle)"
        dateLabel.text = "Başvuru Tarihi: \(formattedDate(application.applicationDate))"
    }
}
