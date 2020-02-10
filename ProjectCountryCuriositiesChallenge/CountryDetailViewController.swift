//
//  CountryDetailView.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 10/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    var countryTitle: UILabel!
    var countryCuriosities: UITextView!
    var country: Country!
    var creditButton: UIButton!
    var coordinator: MainCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        title = country.name
        
        countryTitle = UILabel(frame: .zero)
        countryTitle.textAlignment = .center
        countryTitle.translatesAutoresizingMaskIntoConstraints = false
        countryTitle.font = UIFont(name: "Arial", size: 50)
        countryTitle.text = country.name
        view.addSubview(countryTitle)
        
        countryCuriosities = UITextView(frame: .zero)
        countryCuriosities.textAlignment = .left
        countryCuriosities.translatesAutoresizingMaskIntoConstraints = false
        countryCuriosities.font = UIFont(name: "Times new roman", size: 30)
        countryCuriosities.text = country.curiosities
        countryCuriosities.sizeToFit()
        countryCuriosities.isEditable = false 
        view.addSubview(countryCuriosities)
        
        creditButton = UIButton()
        creditButton.translatesAutoresizingMaskIntoConstraints = false
        creditButton.setTitle("Credits", for: .normal)
        creditButton.titleLabel?.adjustsFontSizeToFitWidth = true
        creditButton.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        creditButton.titleLabel?.textColor = .white
        creditButton.layer.cornerRadius = 7
        creditButton.layer.borderWidth = 1
        creditButton.layer.borderColor = UIColor.black.cgColor
        creditButton.backgroundColor = .black
        creditButton.addTarget(self, action: #selector(showCreditView), for: .touchUpInside)
        view.addSubview(creditButton)
        
        constraintsInitialization()
    }
    
    func constraintsInitialization() {
           
           NSLayoutConstraint.activate([
            
            countryTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countryTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            countryTitle.heightAnchor.constraint(lessThanOrEqualToConstant: 55),
            
            countryCuriosities.topAnchor.constraint(equalTo: countryTitle.safeAreaLayoutGuide.bottomAnchor),
            countryCuriosities.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryCuriosities.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countryCuriosities.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            countryCuriosities.bottomAnchor.constraint(equalTo: creditButton.topAnchor),
            
            creditButton.topAnchor.constraint(equalTo: countryCuriosities.bottomAnchor, constant: 5),
            creditButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            creditButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            creditButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            creditButton.heightAnchor.constraint(equalToConstant: 30),
            creditButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
           ])
           
       }
    
    @objc func showCreditView() {
        
        coordinator?.goToCreditViewController()
    }
    
}
