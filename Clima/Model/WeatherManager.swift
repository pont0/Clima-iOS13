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
        //1. Cria a URL
        if let url = URL(string: urlString){
            //2. Cria URLSession
            let session = URLSession(configuration: .default)
            
            //3. Passa uma tarefa para a sessao
            let task = session.dataTask(with: url) {(data, response, error) in  //closureee
                
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                    
                    
                    /* testando recebimento dos dados
                     let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                     */
                }
                
            }
            
            //4. executa a tarefa
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
        
    }
    
}
