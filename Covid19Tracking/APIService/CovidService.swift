//
//  CovidService.swift
//  Covid19 Tracking
//
//  Created by amrutha on 15/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

class CovidService {
    
     func fetchCovidData(_ country:String,completion: @escaping (CovidData?) -> () ) {
        
        guard let url = URL(string: "https://corona.lmao.ninja/v3/covid-19/countries/\(country)") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){ data,response,error in
            guard let data = data,error == nil else {
                completion(nil)
                return
            }
            let responseData = try? JSONDecoder().decode(CovidData.self, from: data)
            if let covidResponse = responseData {
                completion(covidResponse)
                print(covidResponse)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

