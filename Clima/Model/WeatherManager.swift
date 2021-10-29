//
//  WeatherManager.swift
//  Clima
//
//  Created by Pablo Lisboa on 29/10/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=be5aac5c351f04ee7687dc355ba045f7&units=metric&q="
    
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)\(cityName)"
        print(urlString)
    }
}
