//
//  ActionCountView.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class ActionCountView: UIView {

    private let iconView = UIImageView()
    private let countLabel = UILabel()
    private let titleLabel = UILabel()

    init(title: String, iconName: String, color: UIColor) {
        super.init(frame: .zero)
        titleLabel.text = title
        iconView.image = UIImage(systemName: iconName)
        iconView.tintColor = color
        countLabel.textColor = color
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        iconView.contentMode = .scaleAspectFit
        iconView.setContentHuggingPriority(.required, for: .horizontal)

        countLabel.font = .preferredFont(forTextStyle: .headline)
        countLabel.adjustsFontForContentSizeCategory = true

        titleLabel.font = .preferredFont(forTextStyle: .caption1)
        titleLabel.textColor = .secondaryLabel
        
        isUserInteractionEnabled = true
        accessibilityTraits = .button

        let topStack = UIStackView(arrangedSubviews: [
            iconView,
            countLabel
        ])
        topStack.axis = .horizontal
        topStack.spacing = 6
        topStack.alignment = .center

        let mainStack = UIStackView(arrangedSubviews: [
            topStack,
            titleLabel
        ])
        mainStack.axis = .vertical
        mainStack.spacing = 2
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),

            iconView.heightAnchor.constraint(equalToConstant: 14),
            iconView.widthAnchor.constraint(equalToConstant: 14)
        ])
    }

    func configure(count: Int) {
        countLabel.text = "\(count)"
    }
}
