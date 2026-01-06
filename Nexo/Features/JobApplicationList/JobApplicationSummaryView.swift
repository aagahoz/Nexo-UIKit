//
//  JobApplicationSummaryView.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationSummaryView: UIView {
        
    private let appliedCard = StatusCardView(status: ApplicationStatus.applied)
    private let interviewCard = StatusCardView(status: ApplicationStatus.interview)
    private let offerCard = StatusCardView(status: ApplicationStatus.offer)
    private let rejectedCard = StatusCardView(status: ApplicationStatus.rejected)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        let cardsStack = UIStackView(arrangedSubviews: [
            appliedCard,
            interviewCard,
            offerCard,
            rejectedCard
        ])
        
        cardsStack.axis = .horizontal
        cardsStack.spacing = 12
        cardsStack.distribution = .fillEqually
        cardsStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(cardsStack)
        
        NSLayoutConstraint.activate([
            cardsStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cardsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            cardsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cardsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with counts: [ApplicationStatus: Int]) {
        appliedCard.configure(count: counts[.applied] ?? 0)
        interviewCard.configure(count: counts[.interview] ?? 0)
        offerCard.configure(count: counts[.offer] ?? 0)
        rejectedCard.configure(count: counts[.rejected] ?? 0)
    }
}
