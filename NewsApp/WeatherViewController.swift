//
//  WeatherViewController.swift
//  NewsApp
//
//  Created by Mehul  Singhal  on 30/04/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempratureLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var conditionLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
//    var weather_details = [String:AnyObject]
//    var condition_details = [String:AnyObject]


    let weatherAPIkey = "f4a8baad4dec407090d155358173004"
    var city: String!
    var degree: Float!
    var condition: String!
    var state: String!
    var humidity: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        city = searchBar.text!
        cityLabel.text = city
        fetchWeather()
        
        
    }
    
    
    
    func fetchWeather()
    {
        let para = ["key":"\(weatherAPIkey)","q":"\(city)"]
        Alamofire.request("https://api.apixu.com/v1/current.json", method: .get, parameters: para).responseJSON(completionHandler: {response in
        
            let x = response.value as! NSDictionary
            print(response)
            let y = x["current"] as! [String:AnyObject]
            //weather_details = y
            let z = y["condition"] as! [String:AnyObject]
            //condition_details = z
            let temp = y["feelslike_c"] as? Float
            self.degree = temp
            self.tempratureLabel.text = self.degree.description
            let weatherCond = z["text"] as? String
            self.condition = weatherCond
            self.conditionLabel.text = self.condition
            let humditiyLevel = y["humidity"] as? Int
            self.humidity = humditiyLevel
            self.humidityLabel.text = self.humidity.description
            let m = x["location"] as! [String:AnyObject]
            let stateName = m["region"] as? String
            self.state = stateName
            self.stateLabel.text = self.state
            print(y)
            print(z)
            
            
        })
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
