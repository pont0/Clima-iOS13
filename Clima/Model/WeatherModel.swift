//
//  WeatherModel.swift
//  Clima
//
//  Created by Bruna Machado on 09/11/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation


struct WeatherModel{
    
    let conditionId: Int
    let temp: Double
    let cityName: String
    
    //computed property
    
    var temperatureString: String{
        return String(format: "%.1f", temp)
        
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
            
        }
    }
    /*
    func getConditionName(weatherId: Int)-> String{
        
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
            
        }
    }*/
    
}
