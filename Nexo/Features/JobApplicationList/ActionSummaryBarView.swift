//
//  ActionSummaryBarView.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class ActionSummaryBarView: UIView {

    private let urgentView = ActionCountView(
        title: "Acil Yap",
        iconName: "exclamationmark.circle.fill",
        color: .systemRed
    )

    private let importantView = ActionCountView(
        title: "Yakında Hallet",
        iconName: "exclamationmark.triangle.fill",
        color: .systemOrange
    )

    private let normalView = ActionCountView(
        title: "Acelesi Yok",
        iconName: "circle.fill",
        color: .secondaryLabel
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        configureMockData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .tertiarySystemBackground
        layer.cornerRadius = 8

        let stackView = UIStackView(arrangedSubviews: [
            urgentView,
            importantView,
            normalView
        ])

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            stackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func configureMockData() {
        urgentView.configure(count: 2)
        importantView.configure(count: 4)
        normalView.configure(count: 3)
    }
}
