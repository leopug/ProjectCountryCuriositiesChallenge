//
//  MainCoordinator.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 10/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToCountryDetailViewController(with selectedCountry: Country) {
        
        let countryDetailView = CountryDetailViewController()
        countryDetailView.country = selectedCountry
        countryDetailView.coordinator = self 
        
        navigationController.pushViewController(countryDetailView, animated: true)
        
    }
    
    func goToCreditViewController(){
        let creditViewController = CreditViewController()
        creditViewController.coordinator = self
        navigationController.pushViewController(creditViewController, animated: true)
    }
    
    func returnToMainMenu() {
        navigationController.popToRootViewController(animated: true)
    }
    
}
