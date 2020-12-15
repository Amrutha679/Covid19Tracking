//
//  CovidViewModel.swift
//  Covid19Tracking
//
//  Created by amrutha on 15/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class CovidViewModel {
    
    var covidService = CovidService()
    
    func getCovidInfo(country:String, completion: @escaping (CovidData?) -> ()) {
        
        covidService.fetchCovidData(country: country) { CovidData in
            if CovidData != nil {
                completion(CovidData)
            } else {
                completion(nil)
            }
        }
    }
}
