//
//  ViewController.swift
//  Covid19Tracking
//
//  Created by amrutha on 15/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryName: UITextField!
    @IBOutlet weak var activeCases: UILabel!
    
    var covidViewModel = CovidViewModel()
    var country:String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        countryName.returnKeyType = .done
        countryName.autocapitalizationType = .words
        countryName.autocorrectionType = .no
        countryName.delegate = self
        //country = self.countryName.text ?? ""
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        country = countryName.text ?? ""
        print(" country is \(countryName.text)")
        
        covidViewModel.getCovidInfo(country: country){ CovidData in
            if CovidData != nil {
                DispatchQueue.main.async {
                    self.activeCases.text = "\(String(describing: CovidData?.active))"
                    print(CovidData?.active)
                }
            }
        }
    }
}
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
