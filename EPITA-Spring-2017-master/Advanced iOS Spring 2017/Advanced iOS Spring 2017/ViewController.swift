//
//  ViewController.swift
//  Advanced iOS Spring 2017
//
//  Created by Suiz Uzcate	gui on 19/04/2017.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    ///@IBOutlet weak var cityLabel: UILabel!
    ///@IBOutlet weak var tempLabel: UILabel! //! unpacking nullable optional tzn ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //My glorious comment for commenting purposes
        // Do any additional setup after loading the view, typically from a nib.
        
        //let weather = WeatherFetch()
        //weather.getWeather(city: "Berlin")
        let weather = Weather(city: "Berlin",temp: 27,pict: nil)
        ///cityLabel.text = weather!.city
        ///tempLabel.text = String(describing: weather!.temp).description
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

}

