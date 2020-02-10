//
//  CountryDetailView.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 10/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class CountryDetailView: UIViewController {

    var countryTitle: UILabel!
    var countryCuriosities: UILabel!
    var country: Country!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        countryTitle = UILabel(frame: .zero)
        countryTitle.textAlignment = .center
        countryTitle.translatesAutoresizingMaskIntoConstraints = false
        countryTitle.font = UIFont(name: "Arial", size: 50)
        countryTitle.translatesAutoresizingMaskIntoConstraints = false
        countryTitle.text = "Brasil sil sil"
        view.addSubview(countryTitle)
        
        countryCuriosities = UILabel(frame: .zero)
        countryCuriosities.textAlignment = .left
        countryCuriosities.translatesAutoresizingMaskIntoConstraints = false
        countryCuriosities.font = UIFont(name: "Times new roman", size: 30)
        countryCuriosities.translatesAutoresizingMaskIntoConstraints = false
        countryCuriosities.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at nunc neque. Integer luctus mattis enim quis sollicitudin. Sed congue, erat id ornare euismod, leo ex bibendum ante, id gravida libero sem a libero. Sed consequat posuere mollis. Vestibulum vitae purus quis nulla pretium molestie. Sed iaculis erat id mollis dictum. Vivamus tempor sem et cursus aliquet. Etiam vulputate placerat diam eu sagittis. Curabitur volutpat vestibulum ipsum quis imperdiet. Nullam tincidunt porttitor aliquam. Nunc a scelerisque turpis. Donec vitae sem nec quam eleifend posuere. Curabitur porta convallis velit eget vestibulum. Etiam at neque in mi venenatis maximus."
        countryCuriosities.lineBreakMode = .byWordWrapping
        countryCuriosities.numberOfLines = 0
        view.addSubview(countryCuriosities)
        
        
        constraintsInitialization()
        
    }
    
    func constraintsInitialization() {
           
           NSLayoutConstraint.activate([
            
            countryTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryTitle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countryTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            countryCuriosities.topAnchor.constraint(equalTo: countryTitle.safeAreaLayoutGuide.topAnchor),
            countryCuriosities.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            countryCuriosities.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countryCuriosities.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            countryCuriosities.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
           ])
           
       }

}
