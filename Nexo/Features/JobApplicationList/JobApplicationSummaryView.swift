//
//  JobApplicationSummaryView.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class JobApplicationSummaryView: UIView {
        
    private let prospectedCard = StatusCardView(status: ApplicationStatus.prospect)
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

        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        let cardsStack = UIStackView(arrangedSubviews: [
            prospectedCard,
            appliedCard,
            interviewCard,
            offerCard,
            rejectedCard
        ])
        
        [prospectedCard, appliedCard, interviewCard, offerCard, rejectedCard].forEach {
            $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
        }

        cardsStack.axis = .horizontal
        cardsStack.spacing = 12
        cardsStack.alignment = .fill
        cardsStack.translatesAutoresizingMaskIntoConstraints = false

        addSubview(scrollView)
        scrollView.addSubview(cardsStack)

        NSLayoutConstraint.activate([
            // scrollView frame
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            // stackView content
            cardsStack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            cardsStack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -16),
            cardsStack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            cardsStack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),

            // yükseklik kilidi (çok önemli)
            cardsStack.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor, constant: -32)
        ])
    }
    
    func configure(with counts: [ApplicationStatus: Int]) {
        configure(card: prospectedCard, count: counts[.prospect] ?? 0)
        configure(card: appliedCard, count: counts[.applied] ?? 0)
        configure(card: interviewCard, count: counts[.interview] ?? 0)
        configure(card: offerCard, count: counts[.offer] ?? 0)
        configure(card: rejectedCard, count: counts[.rejected] ?? 0)
    }

    private func configure(card: StatusCardView, count: Int) {
        if count == 0 {
            card.isHidden = true
        } else {
            card.isHidden = false
            card.configure(count: count)
        }
    }
}
