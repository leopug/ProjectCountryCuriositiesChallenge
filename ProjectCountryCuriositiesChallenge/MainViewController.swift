//
//  ViewController.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 06/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import UIKit
import Combine

class MainViewController: UIViewController,UITableViewDelegate {

    var imageView: UIImageView!
    var tableView: UITableView!
    var tableViewDataSource: CountryTableDataSource!
    var countryLabel: UILabel!
    var detailButton: UIButton!
    var selectedCountry: Country!
    var coordinator: MainCoordinator?

    var countrySwitch: UISwitch!
    var cancellable: AnyCancellable?
    
    private var viewModel = MainViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainViewController()
        
        setupImageView()
        
        setupTableView()
        
        setupCountryLabel()
        
        setupSwitch()
        
        setupDetailButton()
        
        constraintsInitialization()
        
    }
    
    func setupSwitch(){
        
        countrySwitch = UISwitch()
        countrySwitch.translatesAutoresizingMaskIntoConstraints = false
        countrySwitch.onTintColor = .blue
        cancellable = viewModel.$isCountryChecked.receive(on: DispatchQueue.main).assign(to: \.isOn , on: countrySwitch)
        imageView.addSubview(countrySwitch)

    }
    
    @objc func showCountryDetailButtonPressed(_ sender: UIButton!){
        
        coordinator?.goToCountryDetailViewController(with: selectedCountry)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.invertIsCountryChecked()
        selectedCountry = tableViewDataSource.countries[indexPath.row]
        
        countryLabel.text = selectedCountry.name.replacingOccurrences(of: "_", with: " ")
        if selectedCountry.fileName == "br" {
            countryLabel.textColor = .white
        } else {
            countryLabel.textColor = .blue
        }
        
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
    
    fileprivate func setupTableView() {
        tableView = UITableView()
        tableViewDataSource = CountryTableDataSource()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.global(qos: .default).async {
            [weak self] in
            self?.tableViewDataSource.loadTableViewData()
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                let indexPath = IndexPath(row: 0, section: 0)
                self?.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
            }
        }
        
        view.addSubview(tableView)
    }
    
    fileprivate func setupMainViewController() {
        view.backgroundColor = .lightGray
        title = "Country Curiosities"
        viewModel.timerInit()
    }
    
    fileprivate func setupImageView() {
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        view.addSubview(imageView)
    }
    
    fileprivate func setupCountryLabel() {
        countryLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100)))
        countryLabel.textAlignment = .center
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        countryLabel.textColor = .blue
        imageView.addSubview(countryLabel)
    }
    
    fileprivate func setupDetailButton() {
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
        imageView.addSubview(detailButton)
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
            detailButton.widthAnchor.constraint(equalToConstant: 100),
            
            countrySwitch.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            countrySwitch.bottomAnchor.constraint(equalTo: detailButton.topAnchor, constant: -20),
            countrySwitch.widthAnchor.constraint(equalToConstant: 70)
            
        ])
        
    }

}
