//
//  AddJobApplicationViewController.swift
//  Nexo
//
//  Created by Agah Ozdemir on 6.01.2026.
//

import UIKit

final class AddJobApplicationViewController: UIViewController {
    
    private let companyTextField = UITextField()
    private let positionTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Yeni Başvuru"
        
        setupUI()
        setupSaveButton()
    }
    
    private func setupUI() {
        companyTextField.placeholder = "Firma adı"
        positionTextField.placeholder = "Pozisyon"
        
        companyTextField.borderStyle = .roundedRect
        positionTextField.borderStyle = .roundedRect
        
        let stackView = UIStackView(arrangedSubviews: [
            companyTextField,
            positionTextField
        ])
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupSaveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Kaydet", style: .prominent, target: self, action: #selector(saveTapped)
        )
    }
    
    @objc private func saveTapped() {
        guard
            let company = companyTextField.text,
            !company.isEmpty,
            let position = positionTextField.text,
            !position.isEmpty
        else {
            return
        }
        
        let newApplication = JobApplication(id: UUID(), companyName: company, positionTitle: position, platform: "Manual", applicationDate: Date(), status: .applied, contacts: [], steps: [], deadlines: [])
        
        JobApplicationRepository.shared.add(newApplication)
        navigationController?.popViewController(animated: true)
    }
}
