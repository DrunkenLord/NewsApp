//
//  ViewController.swift
//  NewsApp
//
//  Created by Mehul  Singhal  on 29/04/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit

var news_channel: String!
let news_array = ["bbc-news","the-times-of-india","techcrunch"]

class ViewController: UIViewController {
    


    @IBOutlet weak var BBCbutton: UIButton!
    @IBOutlet weak var TOIbutton: UIButton!
    @IBOutlet weak var Randombutton: UIButton!
    
    
       let apiKey = "86682be37eaa4e739dc706f4b750fe49"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BBCnews(_ sender: Any) {
        
        news_channel = news_array[0]
//        let storyBoard = UIStoryboard(name: "sharingan", bundle: nil)
//        let controller = storyBoard.instantiateInitialViewController(withIdentifier: "sharingan")
//        self.present(controller!,animated:true,completion:nil)
        
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    @IBAction func TOInews(_ sender: Any) {
        
        news_channel = news_array[1]
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    @IBAction func randomNews(_ sender: Any) {
        
        news_channel = news_array[2]
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    
    


}

