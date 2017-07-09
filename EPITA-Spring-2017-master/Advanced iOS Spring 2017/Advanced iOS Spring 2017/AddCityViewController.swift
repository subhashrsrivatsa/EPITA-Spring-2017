//
//  AddCityViewController.swift
//  Advanced iOS Spring 2017
//
//  Created by Guest User on 01/06/17.
//  Copyright © 2017 ___AdvancediOS___. All rights reserved.
//

import UIKit
import os.log

class AddCityViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var saveButtonOutlet: UIBarButtonItem!


    var weather : Weather? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for : segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButtonOutlet else {
            os_log("Saved", log: OSLog.default, type: .debug)
            return
        }
        
        //Checking if city name contains any numbers
        let city = cityNameTextField.text
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = city?.rangeOfCharacter(from: decimalCharacters)
        if decimalRange != nil {
            return
        }
        
        //Checking if temperature is a number
        let temp = Int(tempTextField.text!)
        if temp == nil{
            return
        }

        
        weather = Weather.init(city: city!, temp: Int(temp!), pict: nil)
    }

}
