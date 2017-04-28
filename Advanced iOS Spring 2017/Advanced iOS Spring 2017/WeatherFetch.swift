//
//  WeatherFetch.swift
//  Advanced iOS Spring 2017
//
//  Created by Suiz Uzcategui on 27/04/2017.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import Foundation

class WeatherFetch {
    
    private let openWeatherMapBaseURL = "http://api.openweathermap.org/data/2.5/boogity"
    private let openWeatherMapAPIKey = "Y0URK3YG03SH3R3"
    
    func getWeather(city: String) {
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)")!
        
        // The data task retrieves the data.
        let dataTask = session.dataTask(with: weatherRequestURL) {
            (data:Data?, response:URLResponse?, error:Error?) in
            if let error = error {
                // Server has returned an error
                print("Error:\n\(error)")
            
            else {
                // Server has returned data
                print("Raw data:\n\(data!)\n")
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                print("Human-readable data:\n\(data!)")
            }
        }
        dataTask.resume()
    }
}
