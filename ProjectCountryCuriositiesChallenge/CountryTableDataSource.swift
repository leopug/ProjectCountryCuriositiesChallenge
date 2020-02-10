//
//  CountryTableDataSource.swift
//  ProjectCountryCuriositiesChallenge
//
//  Created by Ana Caroline de Souza on 10/02/20.
//  Copyright © 2020 Ana e Leo Corp. All rights reserved.
//

import Foundation
import UIKit

class CountryTableDataSource: NSObject, UITableViewDataSource {
    
    var countries = [Country]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name.replacingOccurrences(of: "_", with: " ")
        return cell
    }
    
    func loadTableViewData() {
            if let result = loadDataFromFile() {
                countries = result
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
