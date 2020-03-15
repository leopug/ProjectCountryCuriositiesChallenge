//
//  MainViewControllerViewModel.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 15/03/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation

class MainViewControllerViewModel {
    @Published var isCountryChecked: Bool = false
    
    @objc func invertIsCountryChecked() {
        isCountryChecked.toggle()
    }
    //combine example assyncronous view update
    func timerInit() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(invertIsCountryChecked), userInfo: nil, repeats: true)
    }
    
}
