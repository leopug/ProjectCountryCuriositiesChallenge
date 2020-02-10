//
//  CreditViewController.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 10/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController {
    
    var creditDescriptionLabel: UILabel!
    var authorLabel: UILabel!
    var returnButton: UIButton!
    var coordinator: MainCoordinator?
    
    fileprivate func setupAuthorLabel() {
        authorLabel = UILabel(frame: .zero)
        authorLabel.textAlignment = .center
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.font = UIFont(name: "Arial", size: 50)
        authorLabel.text = "Author: Leo"
        view.addSubview(authorLabel)
    }
    
    fileprivate func setupCreditDescriptionLabel() {
        creditDescriptionLabel = UILabel(frame: .zero)
        creditDescriptionLabel.textAlignment = .center
        creditDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        creditDescriptionLabel.font = UIFont(name: "Arial", size: 25)
        creditDescriptionLabel.numberOfLines = 2
        creditDescriptionLabel.text = "This app was made for educational purposes only."
        view.addSubview(creditDescriptionLabel)
    }
    
    fileprivate func setupReturnButton() {
        returnButton = UIButton(type: .roundedRect)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.setTitle("Return to Countries list", for: .normal)
        returnButton.titleLabel?.adjustsFontSizeToFitWidth = true
        returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        returnButton.layer.cornerRadius = 5
        returnButton.layer.borderWidth = 1
        returnButton.layer.borderColor = UIColor.black.cgColor
        returnButton.addTarget(self, action: #selector(returnToCountriesList), for: .touchUpInside)
        view.addSubview(returnButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupAuthorLabel()
        
        setupCreditDescriptionLabel()
        
        setupReturnButton()
        
        constraintsInitialization()
    }
    
    @objc func returnToCountriesList() {
        
        coordinator?.returnToMainMenu()

    }
    
    func constraintsInitialization() {
           
           NSLayoutConstraint.activate([
            
            authorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            authorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            authorLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 55),
            
            creditDescriptionLabel.topAnchor.constraint(equalTo: authorLabel.safeAreaLayoutGuide.bottomAnchor),
            creditDescriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            creditDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            creditDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            creditDescriptionLabel.bottomAnchor.constraint(equalTo: returnButton.topAnchor),
            
            returnButton.topAnchor.constraint(equalTo: creditDescriptionLabel.safeAreaLayoutGuide.bottomAnchor),
            returnButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            returnButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            returnButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            returnButton.heightAnchor.constraint(equalToConstant: 60),
            returnButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
           ])
           
       }

}
