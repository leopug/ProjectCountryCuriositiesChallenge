//
//  MainCoordinator.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 10/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinator:[Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
}
