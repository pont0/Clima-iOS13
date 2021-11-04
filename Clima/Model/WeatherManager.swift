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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //1. Create a URL
        if let url = URL(string: urlString){
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give this session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. Start the task
            task.resume()
        }
        
        
    }
    
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        
        if error != nil{
            print(error!)
            return
        }
        
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
        
    }
}
