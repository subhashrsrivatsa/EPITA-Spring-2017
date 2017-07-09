//
//  WeatherDetailScreenViewController.swift
//  Advanced iOS Spring 2017
//
//

import UIKit

class WeatherDetailScreenViewController: UIViewController {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!

    var data:Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = data?.city
        tempLabel.text = String(describing: data!.temp) + "°"
        weatherImage.image = data?.pict
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
