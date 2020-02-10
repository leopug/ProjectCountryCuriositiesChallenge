//
//  ViewController.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 06/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var imageView: UIImageView!
    var tableView: UITableView!
    var countryLabel: UILabel!
    var detailButton: UIButton!
    var selectedCountry: Country!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        title = "Country Curiosities"
        
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
        
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        loadTableViewData()
        view.addSubview(tableView)
        
        countryLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100)))
        countryLabel.textAlignment = .center
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.font = UIFont(name: "Arial", size: 40)
        countryLabel.textColor = .blue
        imageView.addSubview(countryLabel)
        
        detailButton = UIButton(type: .roundedRect)
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        detailButton.setTitle("Details", for: .normal)
        detailButton.alpha = 0
        detailButton.titleLabel?.adjustsFontSizeToFitWidth = true
        detailButton.titleLabel?.font = UIFont.systemFont(ofSize: 26)
        detailButton.layer.cornerRadius = 5
        detailButton.layer.borderWidth = 1
        detailButton.layer.borderColor = UIColor.black.cgColor
        detailButton.addTarget(self, action: #selector(showCountryDetailButtonPressed), for: .touchUpInside)
        detailButton.isEnabled = true
        imageView.addSubview(detailButton)
        
        constraintsInitialization()
        
    }
    
    @objc func showCountryDetailButtonPressed(_ sender: UIButton!){
        print("it works!")
        
        navigationController?.pushViewController(CountryDetailView(), animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name.replacingOccurrences(of: "_", with: " ")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCountry = countries[indexPath.row]
        
        countryLabel.text = selectedCountry.name.replacingOccurrences(of: "_", with: " ")
        imageView.image = UIImage(named: selectedCountry.fileName)
        
        if detailButton.alpha == 1 {
            UIView.animate(withDuration: 1) {
                self.detailButton.alpha = 0
            }
            UIView.animate(withDuration: 1) {
                self.detailButton.alpha = 1
            }
        } else {
        UIView.animate(withDuration: 1) {
            self.detailButton.alpha = 1
            }
            
        }
    }
    
    func constraintsInitialization() {
        
        NSLayoutConstraint.activate([
        
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            countryLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            countryLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            countryLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.8),
            
            detailButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            detailButton.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            detailButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    func loadTableViewData() {
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            if let result = self?.loadDataFromFile() {
                self?.countries = result
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    func loadDataFromFile()-> [Country]? {
        if let url = Bundle.main.url(forResource: "CountriesCuriosities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(CountriesCuriosities.self, from: data)
                return jsonData.countryCuriosities
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }

}

