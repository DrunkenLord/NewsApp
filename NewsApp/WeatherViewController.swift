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

    @IBOutlet weak var bgView: UIImageView!
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
        //animation starts from here
        
        cityLabel.alpha = 0
        tempratureLabel.alpha = 0
        stateLabel.alpha = 0
        conditionLabel.alpha = 0
        humidityLabel.alpha = 0
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.bgView.alpha = 1
        }) {(true) in
            self.cityShow()
        }
    }
    
        func cityShow()
        {
            UIView.animate(withDuration: 1, animations: {
                self.cityLabel.alpha = 1
            }) {(true) in
                self.tempratureShow()
            }
        }
    
        func tempratureShow()
        {
            UIView.animate(withDuration: 1, animations: {
                self.tempratureLabel.alpha = 1
            }) {(true) in
                self.stateShow()
            }
    }
    
        func stateShow()
        {
            UIView.animate(withDuration: 1, animations: {
                self.stateLabel.alpha = 1
            }) {(true) in
                self.conditionShow()
            }
    }
    
        func conditionShow()
        {
            UIView.animate(withDuration: 1, animations: {
                self.conditionLabel.alpha = 1
            }) {(true) in
                self.humidityShow()
            }
    }
    
        func humidityShow()
        {
            UIView.animate(withDuration: 1, animations: {
                self.humidityLabel.alpha = 1
            })
            
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        cityLabel.alpha = 0
        tempratureLabel.alpha = 0
        stateLabel.alpha = 0
        conditionLabel.alpha = 0
        humidityLabel.alpha = 0

        
        city = searchBar.text!
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
            UIView.animate(withDuration: 3, animations: {
                self.tempratureLabel.text = self.degree.description
                self.tempratureLabel.alpha = 1
            })
            let weatherCond = z["text"] as? String
            self.condition = weatherCond
            UIView.animate(withDuration: 4, animations: {
                self.conditionLabel.text = self.condition
                self.conditionLabel.alpha = 1
            })
            let humditiyLevel = y["humidity"] as? Int
            self.humidity = humditiyLevel
            UIView.animate(withDuration: 5, animations: {
                self.humidityLabel.text = self.humidity.description
                self.humidityLabel.alpha = 1
            })
            let m = x["location"] as! [String:AnyObject]
            let stateName = m["region"] as? String
            self.state = stateName
            UIView.animate(withDuration: 1, animations: {
                self.stateLabel.text = self.state
                self.stateLabel.alpha = 1
            })
            UIView.animate(withDuration: 2, animations:{
                self.cityLabel.text = self.city
                self.cityLabel.alpha = 1
            })
            
            print(y)
            print(z)
            
            
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
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
