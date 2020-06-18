//
//  MainViewControllerViewModel.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 15/03/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation
import Combine

class MainViewControllerViewModel {
    
    @Published var isCountryChecked: Bool = false
    var cancellable: AnyCancellable?

    @objc func invertIsCountryChecked() {
        isCountryChecked.toggle()
    }
    func timerInit() {
        cancellable = Timer.publish(every: 1, on: .current , in: .default)
            .autoconnect()
            .sink {
            _ in
            self.invertIsCountryChecked()
        }
        
    }
    
}
