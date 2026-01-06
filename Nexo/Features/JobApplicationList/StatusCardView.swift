//
//  StatusCardView.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class StatusCardView: UIView {

    private let iconImageView = UIImageView()
    private let countLabel = UILabel()
    private let titleLabel = UILabel()

    init(status: ApplicationStatus) {
        super.init(frame: .zero)
        configureStaticContent(with: status)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureStaticContent(with status: ApplicationStatus) {
        titleLabel.text = status.displayTitle

        iconImageView.image = UIImage(systemName: status.iconName)
        iconImageView.tintColor = status.accentColor
    }

    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 12

        iconImageView.contentMode = .scaleAspectFit
        iconImageView.setContentHuggingPriority(.required, for: .vertical)

        countLabel.font = .preferredFont(forTextStyle: .title2)
        countLabel.adjustsFontForContentSizeCategory = true
        countLabel.textAlignment = .center

        titleLabel.font = .preferredFont(forTextStyle: .caption1)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .secondaryLabel
        titleLabel.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [
            iconImageView,
            countLabel,
            titleLabel
        ])

        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

            iconImageView.heightAnchor.constraint(equalToConstant: 18),
            iconImageView.widthAnchor.constraint(equalToConstant: 18)
        ])
    }

    func configure(count: Int) {
        countLabel.text = "\(count)"
        accessibilityLabel = "\(titleLabel.text ?? ""), \(count) adet"
    }
}
