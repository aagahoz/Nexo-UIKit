//
//  JobApplicationSummaryView.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationSummaryView: UIView {
    
    private let titleLabel = UILabel()
    
    private let appliedLabel = UILabel()
    private let interviewLabel = UILabel()
    private let offerLabel = UILabel()
    private let rejectedLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .secondarySystemBackground
        
        titleLabel.text = "Başvurular Özeti"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            appliedLabel,
            interviewLabel,
            offerLabel,
            rejectedLabel
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with counts: [ApplicationStatus: Int]) {
        appliedLabel.text = "Başvuruldu: \(counts[.applied] ?? 0)"
        interviewLabel.text = "Görüşme: \(counts[.interview] ?? 0)"
        offerLabel.text = "Teklif: \(counts[.offer] ?? 0)"
        rejectedLabel.text = "Olumsuz: \(counts[.rejected] ?? 0)"
        
    }
    
}
