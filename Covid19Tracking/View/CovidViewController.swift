//
//  ViewController.swift
//  Covid19Tracking
//
//  Created by amrutha on 15/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class CovidViewController: UIViewController {

    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var totalCases: UILabel!
    @IBOutlet weak var activeCases: UILabel!
    @IBOutlet weak var recoveredCases: UILabel!
    
   private var covidViewModel = CovidViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        countryName.returnKeyType = .done
        countryName.autocapitalizationType = .words
        countryName.autocorrectionType = .no
        countryName.delegate = self
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
      let country = countryName.text ?? ""
        covidViewModel.getCovidInfo(country){ [weak self] CovidData in
            if CovidData != nil {
                DispatchQueue.main.async {
                    self?.totalCases.text = "\(String(describing: CovidData?.active ?? 0))"
                }
            }
        }
    }
}
extension CovidViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
