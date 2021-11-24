//
//  WeatherManager.swift
//  Clima
//
//  Created by Pablo Lisboa on 29/10/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weather: WeatherModel)
    
    func didFailWithError(_ error: Error)
}


struct WeatherManager {
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=be5aac5c351f04ee7687dc355ba045f7&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String){
        //1. Cria a URL
        if let url = URL(string: urlString){
            //2. Cria URLSession
            let session = URLSession(configuration: .default)
            
            //3. Passa uma tarefa para a sessao
            let task = session.dataTask(with: url) {(data, response, error) in  //closureee
                
                if error != nil{
                    delegate?.didFailWithError(error!)
                    return
                }
                
                if let safeData = data {
                    
                    //variavel para guardar e usar o objeto criado pela parse Json
                    if let weather = self.parseJSON(safeData){
                        //usando delegate pattern para qualquer classe usar
                        delegate?.didUpdateWeather(weatherManager: self, weather: weather)
                        
                        
                        
                        //let weatherVC = WeatherViewController()
                        //weatherVC.didUpdateWeather(weather: weather)
                    }
                    
                    
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
    
    func parseJSON(_ weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let city = decodedData.name
            let temperature = decodedData.main.temp
            
            let weatherModel = WeatherModel(conditionId: id, temp: temperature, cityName: city)
            
            return weatherModel
            
            //print(weatherModel.temperatureString)
        } catch {
            delegate?.didFailWithError(error)

            return nil
        }
        
    }
    
    
    
    
}

