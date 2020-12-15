//
//  CountryData.swift
//  Covid19 Tracking
//
//  Created by amrutha on 15/12/20.
//  Copyright © 2020 amrutha. All rights reserved.
//

import Foundation

struct CovidData: Codable {
    let updated: Int
    let country: String
    let countryInfo: CountryInfo
    let cases, todayCases, deaths, todayDeaths: Int
    let recovered, todayRecovered, active, critical: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Double
    let tests, testsPerOneMillion, population: Int
    let continent: Continent
    let oneCasePerPeople, oneDeathPerPeople, oneTestPerPeople: Int
    let activePerOneMillion, recoveredPerOneMillion, criticalPerOneMillion: Double
}

enum Continent: String, Codable {
    case africa = "Africa"
    case asia = "Asia"
    case australiaOceania = "Australia/Oceania"
    case empty = ""
    case europe = "Europe"
    case northAmerica = "North America"
    case southAmerica = "South America"
}

struct CountryInfo: Codable {
    let id: Int?
    let iso2, iso3: String?
    let lat, long: Double
    let flag: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case iso2, iso3, lat, long, flag
    }
}


