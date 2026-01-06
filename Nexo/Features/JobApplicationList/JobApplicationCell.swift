//
//  JobApplicationCell.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationCell: UITableViewCell {

    static let reuseIdentifier = "JobApplicationCell"

    private let positionLabel = UILabel()
    private let companyLabel = UILabel()

    private let statusIconView = UIImageView()
    private let statusLabel = UILabel()
    private let dateLabel = UILabel()

    private let bottomStack = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        selectionStyle = .none

        positionLabel.font = .preferredFont(forTextStyle: .headline)
        positionLabel.adjustsFontForContentSizeCategory = true

        companyLabel.font = .preferredFont(forTextStyle: .subheadline)
        companyLabel.textColor = .secondaryLabel
        companyLabel.adjustsFontForContentSizeCategory = true

        statusLabel.font = .preferredFont(forTextStyle: .caption1)
        statusLabel.adjustsFontForContentSizeCategory = true

        dateLabel.font = .preferredFont(forTextStyle: .caption1)
        dateLabel.textColor = .secondaryLabel
        dateLabel.adjustsFontForContentSizeCategory = true

        statusIconView.contentMode = .scaleAspectFit
        statusIconView.tintColor = .label
        statusIconView.setContentHuggingPriority(.required, for: .horizontal)

        let statusStack = UIStackView(arrangedSubviews: [
            statusIconView,
            statusLabel
        ])
        statusStack.axis = .horizontal
        statusStack.spacing = 4
        statusStack.alignment = .center

        bottomStack.axis = .horizontal
        bottomStack.spacing = 8
        bottomStack.alignment = .center

        bottomStack.addArrangedSubview(statusStack)
        bottomStack.addArrangedSubview(UIView()) // spacer
        bottomStack.addArrangedSubview(dateLabel)

        let mainStack = UIStackView(arrangedSubviews: [
            positionLabel,
            companyLabel,
            bottomStack
        ])

        mainStack.axis = .vertical
        mainStack.spacing = 6
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            statusIconView.heightAnchor.constraint(equalToConstant: 12),
            statusIconView.widthAnchor.constraint(equalToConstant: 12)
        ])
    }

    func configure(with application: JobApplication) {
        positionLabel.text = application.positionTitle
        companyLabel.text = application.companyName

        statusLabel.text = application.status.displayTitle
        statusLabel.textColor = application.status.accentColor

        statusIconView.image = UIImage(systemName: application.status.iconName)
        statusIconView.tintColor = application.status.accentColor

        dateLabel.text = formattedDate(application.applicationDate)
    }
}
