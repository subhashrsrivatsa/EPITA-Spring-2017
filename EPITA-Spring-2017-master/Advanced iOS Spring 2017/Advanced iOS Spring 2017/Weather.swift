//
//  Weather.swift
//  Advanced iOS Spring 2017
//
//

import Foundation
import UIKit

class Weather {
    
    var city: String
    var temp: Int
    var pict: UIImage?
    
    init?(city: String, temp: Int, pict: UIImage?)
    {
        self.city = city;
        self.temp = temp;
        self.pict = pict;
        
        if(city.isEmpty)
        {
            return nil
        }
    }
    
    

}
