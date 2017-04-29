//
//  TableViewViewController.swift
//  NewsApp
//
//  Created by Mehul  Singhal  on 30/04/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit
import Alamofire

class TableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    
//    var myCustomVariable: ViewController as ViewController
    
//    var getMyVar = self.myCustomVariable.news_channel
    
    let apiKey = "86682be37eaa4e739dc706f4b750fe49"
    var news = [NSDictionary]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = news[indexPath.row]["title"] as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    
    func fetchData()
    {
        let parameter = ["source":"bbc-news","sortBy":"top","apiKey":"\(apiKey)"]
        
        Alamofire.request("https://newsapi.org/v1/articles", method: .get, parameters: parameter).responseJSON(completionHandler: {response in
            
            print(response)
            let x = response.value as! NSDictionary
            let y = x["articles"] as! [NSDictionary]
            self.news = y
            self.tableView.reloadData()
        
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
