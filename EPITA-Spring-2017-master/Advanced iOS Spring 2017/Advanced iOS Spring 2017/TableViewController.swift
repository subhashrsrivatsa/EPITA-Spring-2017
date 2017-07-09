//
//  TableViewController.swift
//  Advanced iOS Spring 2017
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        weatherArr.append(Weather(city: “Bangalore”,temp: 28,pict: UIImage(named:”india”))!)
        weatherArr.append(Weather(city: “Paris”,temp: 30,pict: UIImage(named:”france”))!)
        weatherArr.append(Weather(city: “Berlin”,temp: 25,pict: UIImage(named:”germany”))!)
        weatherArr.append(Weather(city: “Rome”,temp: 16,pict: UIImage(named:”italy”))!)
        weatherArr.append(Weather(city: “Madrid”,temp: 21,pict: UIImage(named:”spain”))!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // sections like Account, Basket,...
        return 1
    }

    var weatherArr = [Weather]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //  number of rows fro each section
        return weatherArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        //reuse this particular cell in order to allow s;ooth scrolling throughout big tables
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = weatherArr[indexPath.row].city
        cell.detailTextLabel?.text = String(describing: weatherArr[indexPath.row].temp.description)
        //todo: different img for different weather weathIcon.textLabel?.
        // Configure the cell...
        */
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "WeatherTableCell", for: indexPath) as?
            WeatherTableViewCell
            else {
                fatalError("error")
        }
        cell.CityLabel.text = weatherArr[indexPath.row].city
        cell.TempLabel.text = String(describing: weatherArr[indexPath.row].temp) + "°"
        cell.ImageWeather.image = weatherArr[indexPath.row].pict
        return cell
    }
    
    @IBAction func unwindToWeatherList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddCityViewController,
            let weather = sourceViewController.weather {
        
            let newIndexPath = IndexPath(row: weatherArr.count, section: 0)
            weatherArr.append(weather)
        
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    var dataToPass:Weather!
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        
        dataToPass = weatherArr[indexPath.row]
        performSegue(withIdentifier: "push", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "push") {
            (segue.destination as! WeatherDetailScreenViewController).data = dataToPass
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
