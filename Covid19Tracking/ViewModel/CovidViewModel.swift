//
//  CovidViewModel.swift
//  Covid19Tracking
//
//  Created by amrutha on 15/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class CovidViewModel {
    
    private var covidService = CovidService()
    
    func getCovidInfo(_ country:String, completion: @escaping (CovidData?) -> ()) {
        
        covidService.fetchCovidData(country) { covidData in
            if covidData != nil {
                completion(covidData)
            } else {
                completion(nil)
            }
        }
    }
}
