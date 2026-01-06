//
//  JobApplicationCell.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationCell: UITableViewCell {
    
    static let reuseIdentifier = "JobApplicationCell"
    
    private let companyLabel = UILabel()
    private let positionLabel = UILabel()
    private let statusLabel = UILabel()
    private let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        companyLabel.font = .boldSystemFont(ofSize: 16)
        positionLabel.font = .systemFont(ofSize: 14)
        statusLabel.font = .systemFont(ofSize: 13)
        dateLabel.font = .systemFont(ofSize: 12)
        
        dateLabel.textColor = .secondaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [
            companyLabel,
            positionLabel,
            statusLabel,
            dateLabel
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(with application: JobApplication) {
        companyLabel.text = application.companyName
        positionLabel.text = application.positionTitle
        statusLabel.text = application.status.displayTitle
        dateLabel.text = formattedDate(application.applicationDate)
    }
    
}
